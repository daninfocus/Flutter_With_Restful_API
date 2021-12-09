import 'package:flutter/material.dart';
import 'package:main/pages/add_page.dart';
import 'package:main/pages/detail_page.dart';
import 'package:main/pages/filter_page.dart';
import 'package:main/pages/home_page.dart';
import 'package:main/pages/search_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MyHomePage(),
    'search': (BuildContext context) => SearchPage(),
    'details': (BuildContext context) => DetailPage(),
    'add': (BuildContext context) => AddPage(),
    'filter': (BuildContext context) => FilterPage(),
  };
}
