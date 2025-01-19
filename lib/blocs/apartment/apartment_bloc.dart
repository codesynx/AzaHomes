import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/apartment_repository.dart';
import 'apartment_event.dart';
import 'apartment_state.dart';

class ApartmentBloc extends Bloc<ApartmentEvent, ApartmentState> {
  final ApartmentRepository repository;

  ApartmentBloc({required this.repository}) : super(ApartmentInitial()) {
    on<LoadApartments>(_onLoadApartments);
    on<FilterByCity>(_onFilterByCity);
    on<ToggleFavorite>(_onToggleFavorite);
    on<LoadFavorites>(_onLoadFavorites);
    on<SearchApartments>(_onSearchApartments);
  }

  Future<void> _onLoadApartments(
    LoadApartments event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(ApartmentLoading());
    try {
      final apartments = await repository.loadApartments();
      emit(ApartmentLoaded(apartments: apartments));
    } catch (e) {
      emit(ApartmentError(e.toString()));
    }
  }

  Future<void> _onFilterByCity(
    FilterByCity event,
    Emitter<ApartmentState> emit,
  ) async {
    if (state is ApartmentLoaded) {
      final currentState = state as ApartmentLoaded;
      emit(ApartmentLoading());
      try {
        final apartments = await repository.getApartmentsByCity(event.city);
        emit(currentState.copyWith(
          apartments: apartments,
          selectedCity: event.city,
        ));
      } catch (e) {
        emit(ApartmentError(e.toString()));
      }
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ApartmentState> emit,
  ) async {
    try {
      await repository.toggleFavorite(event.apartmentId);
      if (state is ApartmentLoaded) {
        final currentState = state as ApartmentLoaded;
        final apartments = await repository.getApartmentsByCity(currentState.selectedCity);
        emit(currentState.copyWith(apartments: apartments));
      }
    } catch (e) {
      emit(ApartmentError(e.toString()));
    }
  }

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<ApartmentState> emit,
  ) async {
    emit(ApartmentLoading());
    try {
      final favorites = await repository.getFavorites();
      emit(ApartmentLoaded(apartments: favorites));
    } catch (e) {
      emit(ApartmentError(e.toString()));
    }
  }

  Future<void> _onSearchApartments(
    SearchApartments event,
    Emitter<ApartmentState> emit,
  ) async {
    if (state is ApartmentLoaded) {
      final currentState = state as ApartmentLoaded;
      emit(currentState.copyWith(searchQuery: event.query));
    }
  }
} 