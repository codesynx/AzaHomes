import 'package:equatable/equatable.dart';
import '../../models/apartment_model.dart';

abstract class ApartmentState extends Equatable {
  const ApartmentState();

  @override
  List<Object> get props => [];
}

class ApartmentInitial extends ApartmentState {}

class ApartmentLoading extends ApartmentState {}

class ApartmentLoaded extends ApartmentState {
  final List<ApartmentModel> apartments;
  final String selectedCity;
  final String searchQuery;

  const ApartmentLoaded({
    required this.apartments,
    this.selectedCity = 'Астана',
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [apartments, selectedCity, searchQuery];

  ApartmentLoaded copyWith({
    List<ApartmentModel>? apartments,
    String? selectedCity,
    String? searchQuery,
  }) {
    return ApartmentLoaded(
      apartments: apartments ?? this.apartments,
      selectedCity: selectedCity ?? this.selectedCity,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class ApartmentError extends ApartmentState {
  final String message;

  const ApartmentError(this.message);

  @override
  List<Object> get props => [message];
} 