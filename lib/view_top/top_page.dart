import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_api/component/app_color.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';
import 'package:flutter_app_api/entity/pokemons_info.dart';
import 'package:flutter_app_api/view_top/top_app_bar.dart';
import 'package:flutter_app_api/view_top/top_view_model.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPage createState() => _TopPage();
}

class _TopPage extends State<TopPage> {
  late TopViewModel _topViewModel;

  @override
  void initState() {
    super.initState();
    _topViewModel = TopViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _topViewModel.getPokemonList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_topViewModel.pokemonsInfo != null) {
              return _initView(_topViewModel.pokemonsInfo!);
            } else {
              return _errorWidget();
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget _initView(PokemonsInfo pokemonsInfo) {
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

  Widget _errorWidget() {
    return Scaffold(
        backgroundColor: AppColor.BACKGROUND_COLOR,
        appBar: TopAppBar(),
        body: Center(
          child: Container(
            child: Text('エラー'),
          ),
        ));
  }

  List<Widget> _pokemonListWidget() {
    List<Widget> list = <Widget>[];
    return list;
  }

  Container _getPokemonInformationCell(PokemonInfo pokemonInfo) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(pokemonInfo.sprites!.frontDefault!),
          Padding(padding: EdgeInsets.only(left: 20)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('ID: ${pokemonInfo.id}'),
              Text('ID: ${pokemonInfo.name}'),
            ],
          ))
        ],
      ),
    );
  }
}
