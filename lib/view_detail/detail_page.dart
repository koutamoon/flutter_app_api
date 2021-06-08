import 'package:flutter/material.dart';
import 'package:flutter_app_api/component/app_color.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';
import 'package:flutter_app_api/entity/types.dart';
import 'package:flutter_app_api/storage/local_storage.dart';
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
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _getPokemonInformation(pokemonInfo),
        ),
      )),
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

  List<Widget> _getPokemonInformation(PokemonInfo pokemonInfo) {
    List<Widget> list = <Widget>[];
    if (pokemonInfo.sprites != null && pokemonInfo.sprites!.frontDefault != null) {
      list.add(_getPokemonImage(pokemonInfo.sprites!.frontDefault!));
      list.add(Padding(padding: EdgeInsets.only(top: 20)));
    }
    list.add(_getPokemonInformationText(id: pokemonInfo.id));
    list.add(Padding(padding: EdgeInsets.only(top: 20)));
    list.add(_getPokemonInformationText(name: pokemonInfo.name));
    list.add(Padding(padding: EdgeInsets.only(top: 20)));
    list.add(_getPokemonInformationText(types: pokemonInfo.types));
    list.add(Padding(padding: EdgeInsets.only(top: 20)));
    list.add(_getPokemonInformationText(height: pokemonInfo.height));
    list.add(Padding(padding: EdgeInsets.only(top: 20)));
    list.add(_getPokemonInformationText(weight: pokemonInfo.weight));
    return list;
  }

  Container _getPokemonImage(String imageURL) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Image.network(
        imageURL,
        scale: 0.5,
      ),
    );
  }

  Container _getPokemonInformationText({int? id, String? name, List<Types>? types, int? height, int? weight}) {
    if (id != null) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Text(
          'ID: $id',
          textAlign: TextAlign.start,
        ),
      );
    } else if (name != null) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Text(
          '名前: ${LocalStorage.share.getPokemonJaName(name)}',
          textAlign: TextAlign.start,
        ),
      );
    } else if (types != null && types.isNotEmpty) {
      String typeStr = '';
      types.forEach((Types element) {
        if (element.type != null && element.type!.name != null) {
          if (typeStr.isNotEmpty) {
            typeStr = typeStr + ', ' + LocalStorage.share.getPokemonJaType(element.type!.name!);
          } else {
            typeStr = LocalStorage.share.getPokemonJaType(element.type!.name!);
          }
        }
      });
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Text(
          'タイプ: \n$typeStr',
          textAlign: TextAlign.start,
        ),
      );
    } else if (height != null) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Text(
          '高さ: $height',
          textAlign: TextAlign.start,
        ),
      );
    } else if (weight != null) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Text(
          '重さ: $weight',
          textAlign: TextAlign.start,
        ),
      );
    } else {
      return Container(width: MediaQuery.of(context).size.width, height: 0);
    }
  }
}
