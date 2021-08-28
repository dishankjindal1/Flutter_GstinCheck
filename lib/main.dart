import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gstsampleproject/viewmodel/gst_view_model.dart';
import 'package:provider/provider.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: GstViewModel())],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context)=> HomeScreen(),
          '*': (context)=> HomeScreen(),
        },
      ),
    );
  }
}
