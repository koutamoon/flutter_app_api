// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonsInfo _$PokemonsInfoFromJson(Map<String, dynamic> json) {
  return PokemonsInfo(
    json['count'] as int?,
    json['next'] as String?,
    json['previous'] as String?,
    (json['results'] as List<dynamic>)
        .map((e) => Species.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonsInfoToJson(PokemonsInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
