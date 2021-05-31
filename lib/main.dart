import 'package:flutter/material.dart';
import 'package:flutter_app_api/view_detail/detail_page.dart';

import 'view_top/top_page.dart';

const String topRoute = '/top';
const String detailRoute = '/detail';

void main() {
  runApp(MaterialApp(
    initialRoute: topRoute,
    routes: {
      topRoute: (context) => TopPage(),
      detailRoute: (context) => DetailPage(),
    },
  ));
}
