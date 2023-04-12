import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'home_screen.dart';

Future<void> main() async {
  // initialise the hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox('notesBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take Notes',
      theme: ThemeData(
        //brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFF393646),

      ),
      // tp remove debug banner
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}