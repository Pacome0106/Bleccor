// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, body_might_complete_normally_catch_error

// import 'package:admob_flutter/admob_flutter.da

import 'package:blecor/models/fonctions.dart';
import 'package:blecor/models/preferences_manager/shared.dart';
import 'package:blecor/pages/home_page.dart';
import 'package:blecor/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/preferences_manager/ProviderManager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await PreferencesService.init();
  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (context) => ThemeProvider()..initializeTheme(),
    child: MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (create) => Shop()),
        ChangeNotifierProvider(create: (create) => ProviderManager()),
      ],
      child:
      const MyApp(),
    ),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: provider.themeData,
        title: 'Eau potable pour tous',
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
        },
      );
    });
  }
}
