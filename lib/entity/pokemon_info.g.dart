// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonInfo _$PokemonInfoFromJson(Map<String, dynamic> json) {
  return PokemonInfo(
    json['id'] as int?,
    json['species'] == null
        ? null
        : Species.fromJson(json['species'] as Map<String, dynamic>),
    json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    json['types'] == null
        ? null
        : Types.fromJson(json['types'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonInfoToJson(PokemonInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'species': instance.species,
      'sprites': instance.sprites,
      'types': instance.types,
    };
