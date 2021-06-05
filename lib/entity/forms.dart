import 'package:json_annotation/json_annotation.dart';

part 'forms.g.dart';

@JsonSerializable()
class Forms {
  Forms(this.name, this.url);

  /// ポケモンの名前(英名)
  String? name;

  /// url ex: https://pokeapi.co/api/v2/pokemon-form/1/
  String? url;

  factory Forms.fromJson(Map<String, dynamic> json) => _$FormsFromJson(json);

  Map<String, dynamic> toJson() => _$FormsToJson(this);
}
