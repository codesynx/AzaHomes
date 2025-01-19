import 'package:flutter/cupertino.dart';

class CategorySelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CategorySelector({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _CategoryItem(
            icon: CupertinoIcons.flame_fill,
            label: 'Популярное',
            isSelected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          _CategoryItem(
            icon: CupertinoIcons.house_fill,
            label: 'Квартиры',
            isSelected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
          _CategoryItem(
            icon: CupertinoIcons.bed_double_fill,
            label: 'Хостелы',
            isSelected: selectedIndex == 2,
            onTap: () => onTap(2),
          ),
          _CategoryItem(
            icon: CupertinoIcons.house_alt_fill,
            label: 'Комнаты',
            isSelected: selectedIndex == 3,
            onTap: () => onTap(3),
          ),
          _CategoryItem(
            icon: CupertinoIcons.house_alt,
            label: 'Коттеджи',
            isSelected: selectedIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: isSelected ? CupertinoColors.white : CupertinoColors.systemGrey,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 