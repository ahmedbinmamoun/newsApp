import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';

class ApiManager {
  static Future<SourseResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourseResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.NewsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources' : sourceId
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=b1c98e0988b0483fa762f83631bf0d74
*/
