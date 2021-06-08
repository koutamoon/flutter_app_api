import 'package:flutter/material.dart';
import 'package:flutter_app_api/component/app_color.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';
import 'package:flutter_app_api/view_detail/detail_view_model.dart';

import 'detail_app_bar.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  late DetailViewModel _detailViewModel;

  @override
  void initState() {
    super.initState();
    _detailViewModel = DetailViewModel();
  }

  @override
  Widget build(BuildContext context) {
    List<String> argumentList = <String>[];
    if (ModalRoute.of(context) != null && ModalRoute.of(context)!.settings.arguments is List<String>) {
      argumentList = ModalRoute.of(context)!.settings.arguments as List<String>;
    }
    if (argumentList.length != 2) {
      return _errorWidget();
    }

    return FutureBuilder(
        future: _detailViewModel.getPokemonInfo(argumentList[0], argumentList[1]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_detailViewModel.pokemonInfo != null) {
              return _initView(_detailViewModel.pokemonInfo!);
            } else {
              return _errorWidget();
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget _initView(PokemonInfo pokemonInfo) {
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
