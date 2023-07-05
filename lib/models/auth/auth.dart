class Auth {
  int? code;
  bool? status;
  String? message;
  List<dynamic>? user;

  Auth({this.code, this.status, this.message, this.user});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        code: json['code'] as int?,
        status: json['status'] as bool?,
        message: json['message'] as String?,
        user: json['user'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
        'user': user,
      };
}
