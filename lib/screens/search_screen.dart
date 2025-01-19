import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/apartment/apartment_bloc.dart';
import '../blocs/apartment/apartment_event.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: null,
        middle: const Text(
          'Направление',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CupertinoTextField(
                  controller: _searchController,
                  placeholder: 'Укажите направление',
                  placeholderStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: CupertinoColors.systemGrey,
                    fontSize: 16,
                  ),
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                  ),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.systemGrey,
                      size: 20,
                    ),
                  ),
                  decoration: null,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),

            // Popular Destinations
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Популярные направления',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Main Cities
            _buildCityButton('Алматы'),
            _buildCityButton('Астана'),
          ],
        ),
      ),
    );
  }

  Widget _buildCityButton(String cityName) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onPressed: () {
        context.read<ApartmentBloc>().add(FilterByCity(cityName));
        Navigator.pop(context);
      },
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.location_solid,
            color: Color(0xFFFF385C),
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            cityName,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: CupertinoColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 