// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonInfo _$PokemonInfoFromJson(Map<String, dynamic> json) {
  return PokemonInfo(
    json['id'] as int?,
    json['name'] as String?,
    (json['forms'] as List<dynamic>?)
        ?.map((e) => Forms.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['species'] == null
        ? null
        : Species.fromJson(json['species'] as Map<String, dynamic>),
    json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    (json['types'] as List<dynamic>?)
        ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..height = json['height'] as int?
    ..weight = json['weight'] as int?;
}

Map<String, dynamic> _$PokemonInfoToJson(PokemonInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'forms': instance.forms,
      'species': instance.species,
      'sprites': instance.sprites,
      'types': instance.types,
    };
