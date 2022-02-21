import 'dart:convert';

import 'package:wallpaper/model/base_response.dart';
import 'package:wallpaper/model/translate_model.dart';
import '../ibm_client.dart';

class TranslateRepository extends IBMClient {
  Future<BaseResponse<TranslateModel?>> translateText(String text, {String from  = "vi", String to = "en"}) async {
    String url = "/v3/translate?version=2018-05-01";
    String dataRaw = "{\"text\": \"$text\", \"model_id\":\"$from-$to\"}";
    var res = await post(url, body: dataRaw);
    if (res.statusCode == 200) {
      return Successful(TranslateModel.fromJson(json.decode(res.body)));
    }
    //print(res.body);
    return Failed("Failed  to traslate");
  }
}