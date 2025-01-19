import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/main_tab_screen.dart';
import 'models/apartment_model.dart';
import 'models/booked_apartment_model.dart';
import 'models/user_model.dart';
import 'blocs/apartment/apartment_bloc.dart';
import 'blocs/apartment/apartment_event.dart';
import 'repositories/apartment_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Adapters
  Hive.registerAdapter(ApartmentModelAdapter());
  Hive.registerAdapter(BookedApartmentModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(OwnerModelAdapter());
  
  // Open Boxes
  await Hive.openBox<ApartmentModel>('apartments');
  await Hive.openBox<BookedApartmentModel>('booked_apartments');
  await Hive.openBox<UserModel>('user');
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  
  runApp(const AzaHomesApp());
}

class AzaHomesApp extends StatelessWidget {
  const AzaHomesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApartmentBloc(
        repository: ApartmentRepository(),
      )..add(LoadApartments()),
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'AzaHomes',
        locale: Locale('ru'),
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: CupertinoColors.white,
          barBackgroundColor: CupertinoColors.white,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: 'Montserrat',
              color: CupertinoColors.black,
            ),
            navTitleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.black,
            ),
            navLargeTitleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
        ),
        home: MainTabScreen(),
      ),
    );
  }
}
