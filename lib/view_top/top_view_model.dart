import 'package:flutter_app_api/api/api_client.dart';
import 'package:flutter_app_api/api/common_error.dart';
import 'package:flutter_app_api/entity/pokemons_info.dart';

class TopViewModel {
  TopViewModel() : _apiClient = ApiClient();

  final ApiClient _apiClient;

  PokemonsInfo? _pokemonsInfo;

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
