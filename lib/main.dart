import 'package:flutter/material.dart';
import 'package:park_sense/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(home: const HomePage(), debugShowCheckedModeBanner: false),
  );
}
