import 'package:json_annotation/json_annotation.dart';

import 'type.dart';

part 'types.g.dart';

@JsonSerializable()
class Types {
  Types(this.slot, this.type);

  int? slot;

  /// タイプ情報
  Type? type;

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}
