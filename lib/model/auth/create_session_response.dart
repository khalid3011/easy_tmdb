///success response after create session
//{
//  "success": true,
//  "session_id": "-----------------"
//}

///failure response after create session
//{
//  "success": false,
//  "failure": true,
//  "status_code": 17,
//  "status_message": "Session denied."
//}

///success response after create session with login
//{
//  "success": true,
//  "expires_at": "2020-09-16 12:09:57 UTC",
//  "request_token": "7f04adb395d32ab5346725b80163573dc623e92a"
//}

///failure response after create session with login
//{
//  "success": false,
//  "status_code": 33,
//  "status_message": "Invalid request token: The request token is either expired or invalid."
//}
class CreateSessionResponse {
  String statusMessage;
  bool success;
  bool failure;
  int statusCode;
  String sessionId;
  String expiresAt;
  String requestToken;

  CreateSessionResponse({
    this.statusMessage,
    this.success,
    this.failure,
    this.statusCode,
    this.sessionId,
    this.expiresAt,
    this.requestToken,
  });

  CreateSessionResponse.fromJson(Map<String, dynamic> json) {
    this.statusMessage = json['status_message']??"";
    this.success = json['success']??false;
    this.failure = json['failure']??true;
    this.statusCode = json['status_code']??0;
    this.sessionId = json['session_id']??"";
    this.expiresAt = json['expires_at']??"";
    this.requestToken = json['request_token']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_message'] = this.statusMessage;
    data['success'] = this.success;
    data['failure'] = this.failure;
    data['status_code'] = this.statusCode;
    data['session_id'] = this.sessionId;
    data['expires_at'] = this.expiresAt;
    data['request_token'] = this.requestToken;
    return data;
  }
}
