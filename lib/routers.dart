import 'package:delivery/view/home/home.dart';
import 'package:flutter/material.dart';

abstract class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String institution = '';
    String phone = '';

    bool matches(RouteSettings settings) =>
        settings.name.startsWith('/institution') &&
        settings.name.contains('/phone');
    if (matches(settings)) {
      String url = settings.name;

      String start = "/institution=";
      String end = "/phone";

      int startIndex = url.indexOf(start);
      int endIndex = url.indexOf(end, startIndex + start.length);
      institution = url.substring(startIndex + start.length, endIndex);

      start = "/phone=";
      startIndex = url.indexOf(start) + start.length;
      phone = url.substring(startIndex);
      settings = null;
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => Home(
        institution: institution,
        phone: phone,
      ),
    );
  }
}
