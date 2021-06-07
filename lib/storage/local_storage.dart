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

  Map<String, PokemonInfo> _pokemonInfoMap = <String, PokemonInfo>{};

  Map<String, PokemonInfo> get pokemonInfoMap => _pokemonInfoMap;

  void resetCache() {
    _pokemonNameList = <JsonStruct>[];
    _pokemonInfoMap = <String, PokemonInfo>{};
  }

  Future<void> parsePokemonNameList() async {
    String jsonStr = await rootBundle.loadString('json/pokemon_name_ja.json');
    List<Map<String, String>> jsonMap = jsonDecode(jsonStr);
    jsonMap.forEach((Map<String, String> e) {
      _pokemonNameList.add(JsonStruct.fromJson(e));
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
      if (pokemonName.en == pokemonEnName) {
        pokemonJaName = pokemonName.ja;
        return;
      }
    });
    return pokemonJaName ?? pokemonEnName;
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
