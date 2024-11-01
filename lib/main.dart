import 'package:fake_image/image_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: const Color(0xFFD0996F),
        canvasColor: const Color(0xFFFDF5EC),
        textTheme: TextTheme(
          headlineSmall: ThemeData.light()
              .textTheme
              .headlineSmall!
              .copyWith(color: const Color(0xFFBC764A)),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFBC764A),
          centerTitle: false,
          foregroundColor: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
                (states) => const Color(0xFFBC764A)),
            foregroundColor: WidgetStateColor.resolveWith(
              (states) => Colors.white,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateColor.resolveWith(
              (states) => const Color(0xFFBC764A),
            ),
            side: WidgetStateBorderSide.resolveWith(
                (states) => const BorderSide(color: Color(0xFFBC764A))),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateColor.resolveWith(
              (states) => const Color(0xFFBC764A),
            ),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateColor.resolveWith(
              (states) => const Color(0xFFBC764A),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: const Color(0xFFFDF5EC),
          primary: const Color(0xFFD0996F),
        ),
      ),
      home: const HomePage(title: 'Fake Currency',),
    );
  }
}