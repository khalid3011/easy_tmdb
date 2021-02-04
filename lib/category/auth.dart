import 'package:easytmdb/export/export_all.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future<RequestTokenResponse> requestToken() async {
    final response = await Utils.fetchData(UrlMaker.requestToken());
    return RequestTokenResponse.fromJson(json.decode(response.body));
  }

  String askPermissionUrl(String token, {bool autoGenerateToken = false}) {
    if (autoGenerateToken) {
      requestToken().then((value) {
        return UrlMaker.askPermission(value.requestToken);
      });
    }

    return UrlMaker.askPermission(token);
  }

  Future<CreateSessionResponse> askPermissionWithLogin(
    String username,
    String password,
    String token, {
    bool autoGenerateToken = false,
  }) async {
    if (autoGenerateToken) {
      await requestToken().then((value) {
        token = value.requestToken;
      });
    }

    final response = await http
        .get(UrlMaker.createSeasonWithLogin(username, password, token));

    return CreateSessionResponse.fromJson(json.decode(response.body));
  }

  Future<CreateSessionResponse> createSession(String token) async {
    final response = await Utils.fetchData(UrlMaker.createSeason(token));

    return CreateSessionResponse.fromJson(json.decode(response.body));
  }

  Future<CreateSessionResponse> signIn(String username, String password) async {
    var response;

    askPermissionWithLogin(username, password, null, autoGenerateToken: true)
        .then((value) {
      response = value;
      if (value.success) {
        createSession(value.requestToken).then((value) {
          response = value;
        });
      }
    });

    return CreateSessionResponse.fromJson(json.decode(response.body));
  }
}
