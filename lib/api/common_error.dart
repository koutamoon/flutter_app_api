class CommonError {
  CommonError(this.statusCode, this.errorTitle, this.errorDescription);

  /// コード
  int statusCode;

  /// エラータイトル
  String errorTitle;

  /// エラー詳細
  String errorDescription;
}
