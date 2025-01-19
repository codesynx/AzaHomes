import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/apartment_model.dart';

class ApartmentRepository {
  static const String boxName = 'apartments';

  Future<Box<ApartmentModel>> _openBox() async {
    return await Hive.openBox<ApartmentModel>(boxName);
  }

  Future<List<ApartmentModel>> loadApartments() async {
    final box = await _openBox();
    
    // Clear existing data to avoid conflicts
    await box.clear();
    
    // Load initial data from JSON
    final String jsonString = await rootBundle.loadString('assets/apartments.json');
    final data = json.decode(jsonString);
    final List<dynamic> apartmentsJson = data['apartments'];
    
    final apartments = apartmentsJson.map((json) => ApartmentModel.fromJson(json)).toList();
    
    // Save to Hive
    await box.addAll(apartments);
    return apartments;
  }

  Future<List<ApartmentModel>> getApartmentsByCity(String city) async {
    final box = await _openBox();
    return box.values.where((apartment) => apartment.city == city).toList();
  }

  Future<void> toggleFavorite(String id) async {
    final box = await _openBox();
    final apartment = box.values.firstWhere((apt) => apt.id == id);
    apartment.isFavorite = !apartment.isFavorite;
    await apartment.save();
  }

  Future<List<ApartmentModel>> getFavorites() async {
    final box = await _openBox();
    return box.values.where((apartment) => apartment.isFavorite).toList();
  }
} 