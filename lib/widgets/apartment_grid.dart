import 'package:flutter/cupertino.dart';
import '../models/apartment_model.dart';
import 'apartment_card.dart';

class ApartmentGrid extends StatelessWidget {
  final List<ApartmentModel> apartments;
  final String searchQuery;

  const ApartmentGrid({
    super.key,
    required this.apartments,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    final filteredApartments = apartments.where((apartment) {
      return searchQuery.isEmpty ||
          apartment.description.toLowerCase().contains(
                searchQuery.toLowerCase(),
              );
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredApartments.length,
      itemBuilder: (context, index) {
        final apartment = filteredApartments[index];
        return ApartmentCard(apartment: apartment);
      },
    );
  }
} 