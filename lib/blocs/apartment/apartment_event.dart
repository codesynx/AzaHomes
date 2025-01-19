import 'package:equatable/equatable.dart';

abstract class ApartmentEvent extends Equatable {
  const ApartmentEvent();

  @override
  List<Object> get props => [];
}

class LoadApartments extends ApartmentEvent {}

class FilterByCity extends ApartmentEvent {
  final String city;

  const FilterByCity(this.city);

  @override
  List<Object> get props => [city];
}

class ToggleFavorite extends ApartmentEvent {
  final String apartmentId;

  const ToggleFavorite(this.apartmentId);

  @override
  List<Object> get props => [apartmentId];
}

class LoadFavorites extends ApartmentEvent {}

class SearchApartments extends ApartmentEvent {
  final String query;

  const SearchApartments(this.query);

  @override
  List<Object> get props => [query];
} 