import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const _IBM_URL = "https://api.us-east.language-translator.watson.cloud.ibm.com/instancaes/33058864d-8fa7-4c94-9363-47dde4251447/v3/";

class IBMClient{
  final IBMClientOptions _client = IBMClientOptions(http.Client());

  Future<http.Response> post(String path, {String? body}) {
    String url = "https://api.us-east.language-translator.watson.cloud.ibm.com/instances/3058864d-8fa7-4c94-9363-47dde4251447/v3/translate?version=2018-05-01";
    print("POST IBM: $url \n body: $body");
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