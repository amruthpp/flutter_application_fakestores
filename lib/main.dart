

import 'package:flutter/material.dart';
import 'package:flutter_application_api_4/controller/home_screen_controller.dart';
import 'package:flutter_application_api_4/controller/product_details_screen_controller.dart';
import 'package:flutter_application_api_4/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(
            create: (context) => ProductDetialsScreenController()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
