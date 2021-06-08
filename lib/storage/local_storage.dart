import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_app_api/entity/json_struct.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';

/// ローカルストレージの管理クラス
class LocalStorage {
  static LocalStorage share = LocalStorage._internal();

  factory LocalStorage() {
    return share;
  }

  LocalStorage._internal();

  /// ポケモンの名前(英・和)リスト
  List<JsonStruct> _pokemonNameList = <JsonStruct>[];

  /// _pokemonNameList(英名・和名)のgetter
  List<JsonStruct> get pokemonNameList => _pokemonNameList;

  /// ポケモンのタイプ(英・和)リスト
  List<JsonStruct> _pokemonTypeList = <JsonStruct>[];

  /// _pokemonTypeList(タイプ)のgetter
  List<JsonStruct> get pokemonTypeList => _pokemonTypeList;

  /// ポケモンの詳細情報リスト
  Map<String, PokemonInfo> _pokemonInfoMap = <String, PokemonInfo>{};

  /// _pokemonInfoMapのgetter
  Map<String, PokemonInfo> get pokemonInfoMap => _pokemonInfoMap;

  /// ローカルストレージに保持しているデータの初期化
  void resetCache() {
    _pokemonNameList = <JsonStruct>[];
    _pokemonTypeList = <JsonStruct>[];
    _pokemonInfoMap = <String, PokemonInfo>{};
  }

  /// ローカルのJSONファイルをDartで扱えるよう変換し、ローカルストレージに保存する
  /// - json/pokemon_name_ja.json
  /// - json/type_ja.json
  Future<void> parsePokemonInfoJson() async {
    // JSONの中身を取り出し文字列として扱う
    String pokemonNameJsonStr = await rootBundle.loadString('json/pokemon_name_ja.json');
    // JSON文字列をListに変換
    List<dynamic> pokemonNameJsonMap = jsonDecode(pokemonNameJsonStr);
    // JsonStruct型に変換し、ローカルストレージに保存
    pokemonNameJsonMap.forEach((e) {
      _pokemonNameList.add(JsonStruct.fromJson(e as Map<String, dynamic>));
    });

    // json/type_ja.jsonで同様の処理を行う

    String pokemonTypeJsonStr = await rootBundle.loadString('json/type_ja.json');
    List<dynamic> pokemonTypeJsonMap = jsonDecode(pokemonTypeJsonStr);
    pokemonTypeJsonMap.forEach((e) {
      _pokemonTypeList.add(JsonStruct.fromJson(e as Map<String, dynamic>));
    });
  }

  /// レスポンスで受け取った情報をローカルストレージに保存する
  /// parameter [pokemonInfo] ポケモンの詳細情報
  void addPokemonInfo(PokemonInfo pokemonInfo) {
    if (!_pokemonInfoMap.containsKey(pokemonInfo.name)) {
      _pokemonInfoMap[pokemonInfo.name!] = pokemonInfo;
    }
  }

  /// ポケモンの名前を英から和に変換する
  /// parameter[pokemonEnName] ポケモンの英名
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

  /// ポケモンのタイプを英から和に変換する
  /// parameter[pokemonEnType] ポケモンの英タイプ
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

  /// ポケモンの英名からローカルストレージのポケモン情報を取得する
  /// parameter[pokemonEnName] ポケモンの英名
  PokemonInfo? getPokemonInfo(String pokemonEnName) {
    // ローカルストレージに引数(ポケモンの英名)で指定したポケモン情報が存在するかチェック
    if (_pokemonInfoMap.containsKey(pokemonEnName)) {
      return _pokemonInfoMap[pokemonEnName];
    } else {
      return null;
    }
  }
}
