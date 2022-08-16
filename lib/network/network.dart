import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkUtil {
  static const String _baseUrl = 'localhost:3000';
  static const String _debugUrl = '10.0.2.2:3000';
  static String get baseUrl => debug ? _debugUrl : _baseUrl;
  static bool get debug => true;

  static final NetworkUtil _instance = NetworkUtil._internal();
  NetworkUtil._internal() {}
  factory NetworkUtil() => _instance;

  Future<List?> getSaleList({int page = 1, int cpp = 15}) async {
    var response = await http.get(Uri.http(baseUrl, '/api/sale',
        {'page': page.toString(), 'cpp': cpp.toString()}));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['data']);
      log('특가 정보 받아오기 성공');
      return jsonDecode(response.body)['data'];
    } else {
      log('특가 정보 받아오기 실패');
      return null;
    }
  }

  Future<bool> postFCMToken(String deviceId, String fcmToken) async {
    var response = await http.post(Uri.http(baseUrl, '/api/token'),
        body: <String, String>{'id': deviceId, 'token': fcmToken});
    if (response.statusCode == 200) {
      log('FCM 토큰 업로드 성공');
      return true;
    } else {
      log('FCM 토큰 업로드 실패');
      return false;
    }
  }

  Future<bool> postKeywordSubscribe(String deviceId, String keyword) async {
    var response = await http.post(Uri.http(baseUrl, '/api/keyword/subscribe'),
        body: <String, String>{'id': deviceId, 'keyword': keyword});
    if (response.statusCode == 200) {
      log('키워드 구독 성공');
      return true;
    } else {
      log('키워드 구독 실패');
      return false;
    }
  }

  Future<bool> deleteKeywordUnsubscribe(String deviceId, String keyword) async {
    var response = await http.delete(
        Uri.http(baseUrl, '/api/keyword/unsubscribe'),
        body: <String, String>{'id': deviceId, 'keyword': keyword});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      log('키워드 구독 취소 성공');
      return true;
    } else {
      log('키워드 구독 취소 실패');
      return false;
    }
  }

  Future<List?> getSubscribedKeywords(String deviceId) async {
    var response =
        await http.get(Uri.http(baseUrl, '/api/keyword', {'id': deviceId}));
    if (response.statusCode == 200) {
      log('키워드 정보 가져오기 성공');
      return jsonDecode(response.body)['data'];
    } else {
      log('키워드 정보 가져오기 실패');
      return null;
    }
  }
}
