import 'package:easy_tmdb/export/export_all.dart';

class Auth {
  Future<RequestTokenResponse> requestToken() async {
    final response = await Utils.fetchData(UrlMaker.requestToken());
    return RequestTokenResponse.fromJson(json.decode(response.body));
  }

  Future<String> askPermissionUrl(
    String token, {
    bool autoGenerateToken = false,
  }) async {
    if (autoGenerateToken) {
      await requestToken().then((value) {
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

    final response = await Utils.fetchData(
      UrlMaker.createSeasonWithLogin(
        username,
        password,
        token,
      ),
    );

    return CreateSessionResponse.fromJson(json.decode(response.body));
  }

  Future<CreateSessionResponse> createSession(String token) async {
    final response = await Utils.fetchData(UrlMaker.createSeason(token));
    return CreateSessionResponse.fromJson(json.decode(response.body));
  }

  Future<CreateSessionResponse> signIn(
    String username,
    String password,
  ) async {
    CreateSessionResponse _csr;

    await askPermissionWithLogin(
      username,
      password,
      null,
      autoGenerateToken: true,
    ).then((CreateSessionResponse value) async {
      if (value.success) {
        _csr = await createSession(value.requestToken);
      }
    });

    return _csr;
  }
}
