class ErrorBaseResponse {
  ErrorBaseResponse({
    required String statusMessage,
    required int statusCode,
  }) {
    _statusMessage = statusMessage;
    _statusCode = statusCode;
  }

  ErrorBaseResponse.fromJson(dynamic json) {
    _statusMessage = json['status_message'];
    _statusCode = json['status_code'];
  }

  String _statusMessage = '';
  int _statusCode = -1;

  String get statusMessage => _statusMessage;

  int get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_message'] = _statusMessage;
    map['status_code'] = _statusCode;
    return map;
  }
}
