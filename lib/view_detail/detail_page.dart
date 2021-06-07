import 'package:flutter/material.dart';
import 'package:flutter_app_api/component/app_color.dart';

import 'detail_app_bar.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return _initView();
  }

  Widget _initView() {
    return Scaffold(
      backgroundColor: AppColor.BACKGROUND_COLOR,
      appBar: DetailAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  Widget _errorWidget() {
    return Scaffold(
        backgroundColor: AppColor.BACKGROUND_COLOR,
        appBar: DetailAppBar(),
        body: Center(
          child: Container(
            child: Text('エラー'),
          ),
        ));
  }
}
