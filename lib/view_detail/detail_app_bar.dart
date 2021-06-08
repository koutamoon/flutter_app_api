import 'package:flutter/material.dart';

/// ポケモン詳細画面のAppBar(header)
class DetailAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return _initView(context);
  }

  AppBar _initView(BuildContext context) {
    return AppBar(
      title: Text('ポケモン図鑑'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
