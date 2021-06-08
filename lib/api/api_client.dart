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
    print('call $urlStr');

    // URLの文字列(https://~)をString型からUri型に変換する
    Uri? uri = Uri.tryParse(urlStr);

    // Uri型への変換に失敗した場合
    if (uri == null) {
      // 404エラーとして、扱う
      throw CommonError(404, 'URLエラー', 'エラーが起きました。');
    }

    // GETリクエストでAPIコールを行う
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      // ResponseをMap<String, dynamic>型に変換する
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
    // ローカルで保持しているJSONをparseする
    await LocalStorage.share.parsePokemonInfoJson();

    // GETリクエストでAPIコールを行う
    final Map<String, dynamic> response = await _get(GET_POKEMON_LIST_PATH);
    // Response(Map<String, dynamic)をPokemonsInfo型に変換する
    PokemonsInfo pokemonsInfo = PokemonsInfo.fromJson(response);
    for (var species in pokemonsInfo.results) {
      await getPokemonByURL(species.url!);
    }
    return pokemonsInfo;
  }

  /// ID・ポケモン名で指定したポケモン情報を取得
  /// Parameter　[parameter] 　ポケモンのID or 名前
  /// Returns   [PokemonInfo]　ポケモン情報
  Future<PokemonInfo> getPokemon(String parameter) async {
    // 引数(parameter)でURLを置換する
    final String path = GET_POKEMON_PATH.replaceAll('{pokemon}', parameter);

    // GETリクエストでAPIコールを行う
    final Map<String, dynamic> response = await _get(path);
    // Response(Map<String, dynamic)をPokemonInfo型に変換する
    PokemonInfo pokemonInfo = PokemonInfo.fromJson(response);
    // Responseで取得したポケモン情報がローカルのストレージに保持されているかチェック
    if (!LocalStorage.share.pokemonInfoMap.containsKey(pokemonInfo.name)) {
      // Responseで取得したポケモン情報をローカルのストレージに保存する
      LocalStorage.share.addPokemonInfo(pokemonInfo);
    }
    return pokemonInfo;
  }

  /// URLで指定したポケモン情報を取得
  /// parameter [url] 　　　　　ポケモンの情報を取得するURL
  /// Returns   [PokemonInfo]　ポケモン情報
  Future<PokemonInfo> getPokemonByURL(String url) async {
    // GETリクエストでAPIコールを行う
    final Map<String, dynamic> response = await _get(url);
    // Response(Map<String, dynamic)をPokemonInfo型に変換する
    PokemonInfo pokemonInfo = PokemonInfo.fromJson(response);
    // Responseで取得したポケモン情報がローカルのストレージに保持されているかチェック
    if (!LocalStorage.share.pokemonInfoMap.containsKey(pokemonInfo.name)) {
      // Responseで取得したポケモン情報をローカルのストレージに保存する
      LocalStorage.share.addPokemonInfo(pokemonInfo);
    }
    return pokemonInfo;
  }
}
