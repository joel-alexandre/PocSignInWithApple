import 'dart:convert';

class User {
  String name;
  String iss;
  String aud;
  String sub;
  String c_hash;
  String email;
  String email_verified;
  int auth_time;
  bool nonce_supported;

  User(this.name, this.iss, this.aud, this.sub, this.c_hash, this.email,
      this.email_verified, this.auth_time, this.nonce_supported);

  User.fromJson(String resoponse) {
    var map = json.decode(resoponse);
    this.name = "";
    this.iss = map["iss"];
    this.aud = map["aud"];
    this.sub = map["sub"];
    this.c_hash = map["c_hash"];
    this.email = map["email"];
    this.email_verified = map["email_verified"];
    this.auth_time = map["auth_time"];
    this.nonce_supported = map["nonce_supported"];
  }
}

/*
{
  "iss":"https://appleid.apple.com",
  "aud":"com.example.pocSignInWithApple",
  "exp":1583187220,"iat":1583186620,
  "sub":"001960.58d52581ed404ce3a424a9a3123818d6.2047",
  "c_hash":"a5r_PKs1R7Frtr_hT3MX4Q",
  "email":"mobile@icarros.com.br",
  "email_verified":"true",
  "auth_time":1583186620,
  "nonce_supported":true
}
*/
