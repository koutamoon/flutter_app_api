import 'package:flutter/material.dart';
import 'package:flutter_app_api/view_detail/detail_page.dart';

import 'view_top/top_page.dart';

const String topPage = '/top';
const String detailPage = '/detail';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      topPage: (context) => TopPage(),
      detailPage: (context) => DetailPage(),
    },
  ));
}
