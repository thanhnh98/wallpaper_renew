import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wallpaper/di/get_it.dart';

final String _IBM_URL = getAppConfigFlavor().variants["IBM_BASE_URL"];

class IBMClient{
  final IBMClientOptions _client = IBMClientOptions(http.Client());

  Future<http.Response> post(String path, {String? body}) {
    String url = "$_IBM_URL$path";
    return _client.post(Uri.parse(url), body: body);
  }
}

class IBMClientOptions extends http.BaseClient {
  final http.Client _inner;

  IBMClientOptions(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    String username = 'apikey';
    String password = 'jTi0076NVdQwb0cNjT7jVA3ci5vGo5D46897KjKvJ9LS';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = basicAuth;
    return _inner.send(request);
  }
}