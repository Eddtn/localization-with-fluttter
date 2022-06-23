import 'package:flutter/material.dart';
import 'package:localization_in_flutter/routes/custom_router.dart';
import 'package:localization_in_flutter/routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
