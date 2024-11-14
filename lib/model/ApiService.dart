import 'dart:convert';
import 'package:geonboni/model/login/LoginReponse.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://live-strong-elk.ngrok-free.app";

  Future<LoginResponseModel?> login(String username, String password) async {
    final url = Uri.parse(baseUrl+"/auth/login");

    // POST 요청 보낼 데이터
    final Map<String, String> requestBody = {
      'email': username,
      'password': password,
    };

    // HTTP POST 요청 보내기
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // JSON 포맷으로 요청
        body: jsonEncode(requestBody), // 요청 본문은 JSON 형식으로 인코딩
      );

      if (response.statusCode == 200) {

        final loginMap = json.decode(response.body);
        return LoginResponseModel.fromJson(loginMap);

      } else {
        // 실패한 경우 처리
        print('로그인 실패: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // 네트워크 오류 처리
      print('에러 발생: $e');
    }
  }
}