import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Auth/RequestTokenResponse.dart';
import 'package:easytmdb/Model/Auth/createSessionResponse.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future<RequestTokenResponse> requestToken() async {
    final response = await http.get(UrlMaker.requestToken());
    return Utils.isValidResponse(response)
        ? RequestTokenResponse.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  String askPermissionUrl({String token, bool autoGenerateToken = false}) {
    if (autoGenerateToken) {
      requestToken().then((value) {
        return UrlMaker.askPermission(value.requestToken);
      });
    }

    return UrlMaker.askPermission(token);
  }

  askPermissionWithLogin(String username, String password,{String token, bool autoGenerateToken = false}) async {

    if(autoGenerateToken){
      await requestToken().then((value) {
        token = value.requestToken;
      });
    }

    final body = json.encode(
        {"request_token": token, "username": username, "password": password});
    final response =
        await http.post(UrlMaker.createSeasonWithLogin(), body: body);

    return Utils.isValidResponse(response)
        ? CreateSessionResponse.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<CreateSessionResponse> createSession(String token) async {
    final body = json.encode({"request_token": token});
    final response = await http.post(UrlMaker.createSeason(), body: body);

    return Utils.isValidResponse(response)
        ? CreateSessionResponse.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
