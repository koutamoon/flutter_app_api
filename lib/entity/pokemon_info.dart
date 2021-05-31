import 'package:json_annotation/json_annotation.dart';

import 'species.dart';
import 'sprites.dart';
import 'types.dart';

part 'pokemon_info.g.dart';

@JsonSerializable()
class PokemonInfo {
  PokemonInfo(this.id, this.species, this.sprites, this.types);

  /// ポケモンのNo
  int? id;

  /// ポケモンの名称情報
  Species? species;

  /// ポケモンのイメージ情報
  Sprites? sprites;

  /// タイプ情報
  Types? types;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => _$PokemonInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInfoToJson(this);
}
