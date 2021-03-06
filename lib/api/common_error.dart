/// APIコール時にエラーが返った際、CommonErrorに変換する
class CommonError implements Exception {
  CommonError(this.statusCode, this.errorTitle, this.errorDescription);

  /// コード
  int statusCode;

  /// エラータイトル
  String errorTitle;

  /// エラー詳細
  String errorDescription;
}
