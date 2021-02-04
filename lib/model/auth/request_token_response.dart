class RequestTokenResponse {
  String expiresAt;
  String requestToken;
  bool success;

  RequestTokenResponse({this.expiresAt, this.requestToken, this.success});

  RequestTokenResponse.fromJson(Map<String, dynamic> json) {
    this.expiresAt = json['expires_at'];
    this.requestToken = json['request_token'];
    this.success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expires_at'] = this.expiresAt;
    data['request_token'] = this.requestToken;
    data['success'] = this.success;
    return data;
  }
}
