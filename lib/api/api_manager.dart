import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';

class ApiManager {
  static Future<SourseResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category' : categoryId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourseResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId, {int page = 1, int pageSize = 20}) async{
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.NewsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources' : sourceId,
      'page' : page.toString(),
      'pageSize' : pageSize.toString()
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> searchNews(String query) async {
  Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.NewsApi, {
    'apiKey': ApiConstants.apiKey,
    'q': query,
  });

  try {
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  } catch (e) {
    rethrow;
  }
}
}

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=b1c98e0988b0483fa762f83631bf0d74
*/
