import 'package:flutter_app_api/api/api_client.dart';
import 'package:flutter_app_api/api/common_error.dart';
import 'package:flutter_app_api/entity/pokemons_info.dart';

/// TOP画面のviewModel
class TopViewModel {
  TopViewModel() : _apiClient = ApiClient();

  final ApiClient _apiClient;

  /// ポケモンの簡易情報リスト
  PokemonsInfo? _pokemonsInfo;

  /// _pokemonsInfoのgetter
  PokemonsInfo? get pokemonsInfo => _pokemonsInfo;

  Future<void> getPokemonList() async {
    await _apiClient.getPokemonList().then((PokemonsInfo value) {
      print(value.toJson());
      _pokemonsInfo = value;
    }).onError((error, stackTrace) {
      if (error is CommonError) {
        print(error.statusCode);
        print(error.errorTitle);
        print(error.errorDescription);
      } else {
        print('$error');
      }
    }).whenComplete(() => print('finished.'));
  }
}
