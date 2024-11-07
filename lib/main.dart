import 'package:flutter/material.dart';
import 'package:dreamscape_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dreamscape Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xFF336699,
            <int, Color>{
              50: Color(0xFFe0eaf3),
              100: Color(0xFFb3c9e0),
              200: Color(0xFF80a5cc),
              300: Color(0xFF4d80b8),
              400: Color(0xFF2665a9),
              500: Color(0xFF336699),
              600: Color(0xFF2e5e8a),
              700: Color(0xFF27527a),
              800: Color(0xFF21466a),
              900: Color(0xFF153354),
            },
          ),
        ).copyWith(
          secondary: Color(0xFF336699),
        ),
        scaffoldBackgroundColor: Color(0xFF0e1b4d),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
