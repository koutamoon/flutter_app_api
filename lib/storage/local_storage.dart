import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_api/entity/json_struct.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';

class LocalStorage {
  static LocalStorage share = LocalStorage._internal();

  factory LocalStorage() {
    return share;
  }

  LocalStorage._internal();

  List<JsonStruct> _pokemonNameList = <JsonStruct>[];

  List<JsonStruct> get pokemonNameList => _pokemonNameList;

  List<JsonStruct> _pokemonTypeList = <JsonStruct>[];

  List<JsonStruct> get pokemonTypeList => _pokemonTypeList;

  Map<String, PokemonInfo> _pokemonInfoMap = <String, PokemonInfo>{};

  Map<String, PokemonInfo> get pokemonInfoMap => _pokemonInfoMap;

  void resetCache() {
    _pokemonNameList = <JsonStruct>[];
    _pokemonInfoMap = <String, PokemonInfo>{};
  }

  Future<void> parsePokemonInfoJson() async {
    String pokemonNameJsonStr = await rootBundle.loadString('json/pokemon_name_ja.json');
    List<dynamic> pokemonNameJsonMap = jsonDecode(pokemonNameJsonStr);
    pokemonNameJsonMap.forEach((e) {
      _pokemonNameList.add(JsonStruct.fromJson(e as Map<String, dynamic>));
    });
    String pokemonTypeJsonStr = await rootBundle.loadString('json/type_ja.json');
    List<dynamic> pokemonTypeJsonMap = jsonDecode(pokemonTypeJsonStr);
    pokemonTypeJsonMap.forEach((e) {
      _pokemonTypeList.add(JsonStruct.fromJson(e as Map<String, dynamic>));
    });
  }

  void parsePokemonInfo(PokemonInfo pokemonInfo) {
    if (!_pokemonInfoMap.containsKey(pokemonInfo.name)) {
      _pokemonInfoMap[pokemonInfo.name!] = pokemonInfo;
    }
  }

  String getPokemonJaName(String pokemonEnName) {
    String? pokemonJaName;
    _pokemonNameList.forEach((JsonStruct pokemonName) {
      if (pokemonName.en.toLowerCase() == pokemonEnName.toLowerCase()) {
        pokemonJaName = pokemonName.ja;
        return;
      }
    });
    return pokemonJaName ?? pokemonEnName;
  }

  String getPokemonJaType(String pokemonEnType) {
    String? pokemonJaType;
    _pokemonTypeList.forEach((JsonStruct pokemonType) {
      if (pokemonType.en.toLowerCase() == pokemonEnType.toLowerCase()) {
        pokemonJaType = pokemonType.ja;
        return;
      }
    });
    return pokemonJaType ?? pokemonEnType;
  }

  void addPokemonInfo(PokemonInfo pokemonInfo) {
    _pokemonInfoMap[pokemonInfo.name!] = pokemonInfo;
  }

  PokemonInfo? getPokemonInfo(String pokemonEnName) {
    if (_pokemonInfoMap.containsKey(pokemonEnName)) {
      return _pokemonInfoMap[pokemonEnName];
    } else {
      return null;
    }
  }
}
