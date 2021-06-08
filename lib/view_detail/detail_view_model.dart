import 'package:flutter_app_api/api/api_client.dart';
import 'package:flutter_app_api/api/common_error.dart';
import 'package:flutter_app_api/entity/pokemon_info.dart';
import 'package:flutter_app_api/storage/local_storage.dart';

/// ポケモン詳細画面のviewModel
class DetailViewModel {
  DetailViewModel() : _apiClient = ApiClient();

  final ApiClient _apiClient;

  /// ポケモンの詳細情報
  PokemonInfo? _pokemonInfo;

  /// _pokemonInfoのgetter
  PokemonInfo? get pokemonInfo => _pokemonInfo;

  Future<void> getPokemonInfo(String pokemonEnName, String url) async {
    // ローカルストレージに保存されたポケモン詳細情報(ローカルストレージに存在しなかった場合、null)
    PokemonInfo? pokemonInfo = LocalStorage.share.getPokemonInfo(pokemonEnName);
    // ローカルストレージに保存されたポケモン詳細情報に該当ポケモンの情報が存在するかチェック
    if (pokemonInfo != null) {
      _pokemonInfo = pokemonInfo;
      return;
    }
    await _apiClient.getPokemonByURL(url).then((PokemonInfo value) {
      _pokemonInfo = value;
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
