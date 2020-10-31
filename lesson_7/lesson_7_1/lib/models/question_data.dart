class QuestionData{
  String _imgUrl;
  String _answer;
  String _variant;

  QuestionData(this._imgUrl, this._answer, this._variant);

  String get variant => _variant;

  set variant(String value) {
    _variant = value;
  }

  String get answer => _answer;

  set answer(String value) {
    _answer = value;
  }

  String get imgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }
}