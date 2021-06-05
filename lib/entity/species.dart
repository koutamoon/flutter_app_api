import 'package:json_annotation/json_annotation.dart';

part 'species.g.dart';

@JsonSerializable()
class Species {
  Species(this.name, this.url);

  /// ポケモンの名前(英名)
  String? name;

  /// url ex: https://pokeapi.co/api/v2/pokemon-species/1/
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
