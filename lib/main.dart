import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'conversion_provider.dart';
import 'conversion_screen.dart';

void main() {
  runApp(TempConversionApp());
}

class TempConversionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConversionProvider(),
      child: MaterialApp(
        title: 'Temperature Conversion App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: ConversionScreen(),
      ),
    );
  }
}
