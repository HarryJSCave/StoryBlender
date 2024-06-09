    class Response {
  late final String text;
  Response({this.text = ''});

  static Future<Response> fromJson(jsonDecode) {
    // Add a return statement here
    return Future.value(Response());
  }
}