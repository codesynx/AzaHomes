import 'package:flutter/cupertino.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearchChanged;

  const CustomSearchBar({
    super.key,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      placeholder: 'Поиск квартир',
      onChanged: onSearchChanged,
      style: const TextStyle(
        fontFamily: 'Montserrat',
      ),
    );
  }
} 