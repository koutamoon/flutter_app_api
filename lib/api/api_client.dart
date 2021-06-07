import 'dart:convert' as convert;

import 'package:flutter_app_api/entity/pokemon_info.dart';
import 'package:flutter_app_api/entity/pokemons_info.dart';
import 'package:flutter_app_api/storage/local_storage.dart';
import 'package:http/http.dart' as http;

import 'common_error.dart';

class ApiClient {
  static const String GET_POKEMON_LIST_PATH = 'https://pokeapi.co/api/v2/pokemon';
  static const String GET_POKEMON_PATH = 'https://pokeapi.co/api/v2/pokemon/{pokemon}';

  /// GET通信でResponseを取得する
  /// Parameter　[url]       　        パス
  /// Returns   [Map<String, Object>]　Response
  Future<Map<String, dynamic>> _get(String urlStr) async {
    Uri? uri = Uri.tryParse(urlStr);
    if (uri == null) {
      // TODO(tsukimisato): HttpStatusごとにエラー内容を分ける
      throw CommonError(404, '', 'エラーが起きました。');
    }
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = convert.jsonDecode(response.body);
      return responseBody;
    } else {
      // TODO(tsukimisato): HttpStatusごとにエラー内容を分ける
      throw CommonError(response.statusCode, '', 'エラーが起きました。');
    }
  }

  /// ポケモンのリストをID順に20件、取得
  /// Return [PokemonsInfo] ポケモンのリスト20件
  Future<PokemonsInfo> getPokemonList() async {
    final Map<String, dynamic> response = await _get(GET_POKEMON_LIST_PATH);
    return PokemonsInfo.fromJson(response);
  }

  /// ID・ポケモン名で指定したポケモン情報を取得
  /// Parameter　[parameter] 　ポケモンのID or 名前
  /// Returns   [PokemonInfo]　ポケモン情報
  Future<PokemonInfo> getPokemon(String parameter) async {
    final String path = GET_POKEMON_PATH.replaceAll('{pokemon}', parameter);
    final Map<String, dynamic> response = await _get(path);
    PokemonInfo pokemonInfo = PokemonInfo.fromJson(response);
    if (!LocalStorage.share.pokemonInfoMap.containsKey(pokemonInfo.name)) {
      LocalStorage.share.addPokemonInfo(pokemonInfo);
    }
    return pokemonInfo;
  }

  /// URLで指定したポケモン情報を取得
  /// parameter [url] 　　　　　ポケモンの情報を取得するURL
  /// Returns   [PokemonInfo]　ポケモン情報
  Future<PokemonInfo> getPokemonByURL(String url) async {
    final Map<String, dynamic> response = await _get(url);
    PokemonInfo pokemonInfo = PokemonInfo.fromJson(response);
    if (!LocalStorage.share.pokemonInfoMap.containsKey(pokemonInfo.name)) {
      LocalStorage.share.addPokemonInfo(pokemonInfo);
    }
    return pokemonInfo;
  }
}
