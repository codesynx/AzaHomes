import 'package:flutter/cupertino.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime checkIn, DateTime checkOut) onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedCheckIn = DateTime.now();
  DateTime _selectedCheckOut = DateTime.now().add(const Duration(days: 1));
  bool _isSelectingCheckOut = false;
  bool _showConfirm = false;

  List<DateTime> _generateDates() {
    final dates = <DateTime>[];
    final now = DateTime.now();
    for (var i = 0; i < 365; i++) {
      dates.add(now.add(Duration(days: i)));
    }
    return dates;
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}';
  }

  String _formatMonth(DateTime date) {
    const months = [
      'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
      'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'
    ];
    return months[date.month - 1];
  }

  bool _isDateSelected(DateTime date) {
    return (_selectedCheckIn.year == date.year &&
            _selectedCheckIn.month == date.month &&
            _selectedCheckIn.day == date.day) ||
        (_selectedCheckOut.year == date.year &&
            _selectedCheckOut.month == date.month &&
            _selectedCheckOut.day == date.day);
  }

  bool _isInRange(DateTime date) {
    return date.isAfter(_selectedCheckIn) && date.isBefore(_selectedCheckOut);
  }

  @override
  Widget build(BuildContext context) {
    final dates = _generateDates();
    DateTime currentMonth = dates.first;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Выберите даты',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(CupertinoIcons.xmark),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Заезд',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatDate(_selectedCheckIn),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      CupertinoIcons.arrow_right,
                      color: CupertinoColors.systemGrey,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Выезд',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatDate(_selectedCheckOut),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 12,
              itemBuilder: (context, monthIndex) {
                final monthStart = DateTime(
                  currentMonth.year,
                  currentMonth.month + monthIndex,
                  1,
                );
                final daysInMonth = DateTime(
                  monthStart.year,
                  monthStart.month + 1,
                  0,
                ).day;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        _formatMonth(monthStart),
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1,
                      ),
                      itemCount: daysInMonth,
                      itemBuilder: (context, dayIndex) {
                        final date = DateTime(
                          monthStart.year,
                          monthStart.month,
                          dayIndex + 1,
                        );
                        final isSelected = _isDateSelected(date);
                        final isInRange = _isInRange(date);
                        final isPastDate = date.isBefore(DateTime.now());

                        return GestureDetector(
                          onTap: isPastDate
                              ? null
                              : () {
                                  setState(() {
                                    if (!_isSelectingCheckOut) {
                                      _selectedCheckIn = date;
                                      _selectedCheckOut = date.add(const Duration(days: 1));
                                      _isSelectingCheckOut = true;
                                    } else {
                                      if (date.isAfter(_selectedCheckIn)) {
                                        _selectedCheckOut = date;
                                        _isSelectingCheckOut = false;
                                        _showConfirm = true;
                                      }
                                    }
                                  });
                                },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? CupertinoColors.activeBlue
                                  : isInRange
                                      ? CupertinoColors.activeBlue.withOpacity(0.1)
                                      : null,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                (dayIndex + 1).toString(),
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: isPastDate
                                      ? CupertinoColors.systemGrey3
                                      : isSelected
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                  fontWeight: isSelected ? FontWeight.bold : null,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          if (_showConfirm)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CupertinoButton.filled(
                borderRadius: BorderRadius.circular(12),
                onPressed: () {
                  widget.onDateSelected(_selectedCheckIn, _selectedCheckOut);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Подтвердить даты',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
} 