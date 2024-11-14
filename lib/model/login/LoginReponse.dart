class LoginResponseModel {
  final String accessToken;
  final String refreshToken;

  LoginResponseModel({required this.accessToken, required this.refreshToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> loginMap) {
    return LoginResponseModel(
      accessToken: loginMap['accessToken'],
      refreshToken: loginMap['refreshToken'],
    );
  }
}
