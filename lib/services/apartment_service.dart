import '../models/apartment.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ApartmentService {
  static Future<List<Apartment>> getApartments(String city) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/apartments.json');
      final data = json.decode(jsonString);
      final List<dynamic> apartmentsJson = data['apartments'];
      
      return apartmentsJson
          .map((json) => Apartment.fromJson(json))
          .where((apartment) => apartment.city == city)
          .toList();
    } catch (e) {
      print('Error loading apartments: $e');
      return [];
    }
  }
} 