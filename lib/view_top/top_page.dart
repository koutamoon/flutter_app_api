import 'package:flutter/material.dart';
import 'package:flutter_app_api/component/app_color.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';
import 'package:flutter_app_api/view_top/top_app_bar.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPage createState() => _TopPage();
}

class _TopPage extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return _initView();
  }

  Widget _initView() {
    return Scaffold(
      backgroundColor: AppColor.BACKGROUND_COLOR,
      appBar: TopAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  Container _getPokemonInformationCell(PokemonInfo pokemonInfo) {
    return Container();
  }
}
