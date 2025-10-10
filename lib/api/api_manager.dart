import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  // static ApiManager? _instance;

  // ApiManager._();

  // static ApiManager getInstance(){
  //   _instance ??= ApiManager._();
  //   return _instance!;
  // }

  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {
       'apiKey': ApiConstants.apiKey,
    }
    )
  );

  ApiManager(){
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
      ));
  }

  Future<SourceResponse?> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        EndPoints.sourceApi,
        queryParameters: {
          'category': categoryId,
        },
      );
      var json = response.data;
      var sourceResponse = SourceResponse.fromJson(json);
      return sourceResponse;
    } catch (e) {
      rethrow;  
    }
  }

  // Future<SourceResponse?> getSources(String categoryId) async {
  //   Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
  //     'apiKey': ApiConstants.apiKey,
  //     'category': categoryId,
  //   });
  //   try {
  //     var response = await http.get(url);
  //     var responseBody = response.body;
  //     var json = jsonDecode(responseBody);
  //     return SourceResponse.fromJson(json);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }



  Future<NewsResponse> getNewsBySourceId(String sourceId, {
    int page = 1,
    int pageSize = 20,
  }) async{
   try {
     var response = await dio.get(EndPoints.newsApi,
     queryParameters: {
      'sources': sourceId,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    });
    var json = response.data;
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
   } catch (e) {
     rethrow;
   }
  }



  // Future<NewsResponse?> getNewsBySourceId(
  //   String sourceId, {
  //   int page = 1,
  //   int pageSize = 20,
  // }) async {
  //   Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.NewsApi, {
  //     'apiKey': ApiConstants.apiKey,
  //     'sources': sourceId,
  //     'page': page.toString(),
  //     'pageSize': pageSize.toString(),
  //   });
  //   try {
  //     var response = await http.get(url);
  //     var responseBody = response.body;
  //     var json = jsonDecode(responseBody);
  //     return NewsResponse.fromJson(json);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }


  searchNewsT() {

  }

  static Future<NewsResponse?> searchNews(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
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
