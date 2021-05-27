class PokemonInfo {
  /// ポケモンのNo
  int id;

  /// ポケモンの名称情報
  Species species;

  /// ポケモンのイメージ情報
  Sprites sprites;

  /// タイプ情報
  Types types;
}

class Species {
  /// ポケモンの名前(英名)
  String name;

  /// url
  String url;
}

class Sprites {
  ///　後画像(オス)
  String back_default;

  ///　後画像(メス)
  String back_female;

  ///　後画像(色違いオス)
  String back_shiny;

  /// 後画像(色違いメス)
  String back_shiny_female;

  ///　前画像(オス)
  String front_default;

  ///　前画像(メス)
  String front_female;

  ///　前画像(色違いオス)
  String front_shiny;

  /// 前画像(色違いメス)
  String front_shiny_female;

  DreamWorld dream_World;

  OfficialArtwork officialArtwork;
}

class DreamWorld {
  String front_default;
  String front_female;
}

class OfficialArtwork {
  String front_default;
}

class Types {
  int slot;

  /// タイプ情報
  Type type;
}

class Type {
  /// タイプ
  String name;

  /// url
  String url;
}
