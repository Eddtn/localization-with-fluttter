import 'package:flutter/material.dart';
import 'package:localization_in_flutter/pages/NotFound_page.dart';
import 'package:localization_in_flutter/pages/about_page.dart';
import 'package:localization_in_flutter/pages/home_pages.dart';
import 'package:localization_in_flutter/pages/settings_page.dart';
import 'package:localization_in_flutter/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
