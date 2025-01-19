import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/apartment/apartment_bloc.dart';
import '../blocs/apartment/apartment_event.dart';
import '../blocs/apartment/apartment_state.dart';
import '../widgets/apartment_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Избранные'),
        border: null,
      ),
      child: BlocBuilder<ApartmentBloc, ApartmentState>(
        builder: (context, state) {
          if (state is ApartmentLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is ApartmentLoaded) {
            final favoriteApartments = state.apartments.where((a) => a.isFavorite).toList();

            if (favoriteApartments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/not-found-illustration-download.png',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Здесь будут отображаться\nпонравившиеся вам объекты',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CupertinoColors.systemGrey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteApartments.length,
              itemBuilder: (context, index) {
                return ApartmentCard(
                  apartment: favoriteApartments[index],
                );
              },
            );
          }

          return const Center(
            child: Text('Что-то пошло не так'),
          );
        },
      ),
    );
  }
} 