import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/apartment/apartment_bloc.dart';
import '../blocs/apartment/apartment_state.dart';
import '../blocs/apartment/apartment_event.dart';
import '../widgets/category_selector.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/apartment_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentBloc, ApartmentState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomSearchBar(
                    onSearchChanged: (query) {
                      context.read<ApartmentBloc>().add(
                            SearchApartments(query),
                          );
                    },
                  ),
                ),
                CategorySelector(
                  selectedIndex: 0,
                  onTap: (index) {
                    // Handle category selection
                  },
                ),
                if (state is ApartmentLoaded)
                  Expanded(
                    child: ApartmentGrid(
                      apartments: state.apartments,
                      searchQuery: state.searchQuery,
                    ),
                  )
                else if (state is ApartmentLoading)
                  const Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                else if (state is ApartmentError)
                  Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
} 