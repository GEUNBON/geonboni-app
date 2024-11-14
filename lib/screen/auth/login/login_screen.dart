import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geonboni/model/ApiService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  final ApiService apiService = ApiService();


  void onLoginPressed() async {
    String id = idController.text;
    String password = pwController.text;

    // 로그인 API 호출
    final response = await apiService.login(id, password);

    // 로그인 성공 시, accessToken 사용
    if (response != null) {
      final accessToken = response.accessToken;
      print("임세혁"+accessToken);
    } else {
      print('로그인에 실패했습니다.');
    }
  }

  void onSignupPressed() {
    // 회원가입 로직
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("로그인"),
        ),
        body:
        Padding(padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: InputDecoration(label: Text("아이디")),
                ),
                TextField(
                  controller: pwController,
                  decoration: InputDecoration(label: Text("비밀번호")),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: onLoginPressed, child: Text("로그인")),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 24),
                  child: ElevatedButton(onPressed: onSignupPressed, child: Text("회원가입")),
                )
              ],
            )));
  }
}
