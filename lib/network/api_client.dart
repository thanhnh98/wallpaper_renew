import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wallpaper/di/get_it.dart';

final String _BASE_URL = getAppConfigFlavor().variants["PHOTO_BASE_URL"];

class ApiClient{
  final ClientOptions _client = ClientOptions(http.Client());
  Future<http.Response> get(String path) {
    String? url;
    if (path.contains("https://")) {
      url = path;
    } else {
      url = _BASE_URL + path;
    }
    print("GET: $url\n");
    return _client.get(Uri.parse(url));
  }

  Future<http.Response> post(String path) {
    String? url;
    if (path.contains("https://")) {
      url = path;
    } else {
      url = _BASE_URL + path;
    }
    print("POST: $url\n");
    return _client.post(Uri.parse(url));
  }
}

class ClientOptions extends http.BaseClient {
  final http.Client _inner;

  ClientOptions(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = '563492ad6f91700001000001cd1fd9b36edc40688ee98cd79f657e12';

    return _inner.send(request);
  }
}