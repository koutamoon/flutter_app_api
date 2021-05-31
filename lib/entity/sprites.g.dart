// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sprites _$SpritesFromJson(Map<String, dynamic> json) {
  return Sprites(
    json['back_default'] as String?,
    json['back_female'] as String?,
    json['back_shiny'] as String?,
    json['back_shiny_female'] as String?,
    json['front_default'] as String?,
    json['front_female'] as String?,
    json['front_shiny'] as String?,
    json['front_shiny_female'] as String?,
    json['dream_World'] == null
        ? null
        : DreamWorld.fromJson(json['dream_World'] as Map<String, dynamic>),
    json['officialArtwork'] == null
        ? null
        : OfficialArtwork.fromJson(
            json['officialArtwork'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'dream_World': instance.dreamWorld,
      'officialArtwork': instance.officialArtwork,
    };
