import 'package:json_annotation/json_annotation.dart';

import 'species.dart';

part 'pokemons_info.g.dart';

@JsonSerializable()
class PokemonsInfo {
  PokemonsInfo(this.count, this.next, this.previous, this.results);

  /// ポケモンの件数
  int? count;

  /// 次のポケモンリストを取得するためのURL
  String? next;

  /// 前のポケモンリストを取得するためのURL
  String? previous;

  /// ポケモンのイメージ情報
  List<Species> results;

  factory PokemonsInfo.fromJson(Map<String, dynamic> json) => _$PokemonsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonsInfoToJson(this);
}
