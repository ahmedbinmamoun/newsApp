import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/SourseResponse.dart';
class ApiManager {

  static Future<SourseResponse?> getSources() async{
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.sourceApi,
      {
        'apiKey' : ApiConstants.apiKey
      }
      );
    try {
      var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return SourseResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}

/*
https://newsapi.org/v2/top-headlines/sources?apiKey=b1c98e0988b0483fa762f83631bf0d74
*/