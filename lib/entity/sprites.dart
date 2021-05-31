import 'package:json_annotation/json_annotation.dart';

import 'dream_world.dart';
import 'official_artwork.dart';

part 'sprites.g.dart';

@JsonSerializable()
class Sprites {
  Sprites(this.backDefault, this.backFemale, this.backShiny, this.backShinyFemale, this.frontDefault, this.frontFemale,
      this.frontShiny, this.frontShinyFemale, this.dreamWorld, this.officialArtwork);

  ///　後画像(オス)
  @JsonKey(name: 'back_default')
  String? backDefault;

  ///　後画像(メス)
  @JsonKey(name: 'back_female')
  String? backFemale;

  ///　後画像(色違いオス)
  @JsonKey(name: 'back_shiny')
  String? backShiny;

  /// 後画像(色違いメス)
  @JsonKey(name: 'back_shiny_female')
  String? backShinyFemale;

  ///　前画像(オス)
  @JsonKey(name: 'front_default')
  String? frontDefault;

  ///　前画像(メス)
  @JsonKey(name: 'front_female')
  String? frontFemale;

  ///　前画像(色違いオス)
  @JsonKey(name: 'front_shiny')
  String? frontShiny;

  /// 前画像(色違いメス)
  @JsonKey(name: 'front_shiny_female')
  String? frontShinyFemale;

  @JsonKey(name: 'dream_World')
  DreamWorld? dreamWorld;

  OfficialArtwork? officialArtwork;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
