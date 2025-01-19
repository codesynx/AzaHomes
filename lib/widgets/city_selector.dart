import 'package:flutter/cupertino.dart';

class CitySelector extends StatelessWidget {
  final String selectedCity;
  final Function(String) onCityChanged;

  const CitySelector({
    super.key,
    required this.selectedCity,
    required this.onCityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedCity,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          const Icon(
            CupertinoIcons.chevron_down,
            size: 14,
          ),
        ],
      ),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                child: const Text('Астана'),
                onPressed: () {
                  onCityChanged('Астана');
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: const Text('Алматы'),
                onPressed: () {
                  onCityChanged('Алматы');
                  Navigator.pop(context);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
} 