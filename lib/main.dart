import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(MainApp());
  });
}

class MainApp extends StatelessWidget {
  var kColorScheme =
      ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
  var kDarkColorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
            colorScheme: kDarkColorScheme,
            cardTheme: CardTheme().copyWith(
                color: kDarkColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkColorScheme.primaryContainer))),
        home: Expenses(),
        theme: ThemeData().copyWith(
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.onPrimary,
            ),
            cardTheme: CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 14)),
            colorScheme: kColorScheme));
  }
}
