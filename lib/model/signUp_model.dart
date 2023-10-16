class SignUpModel {
  bool? success;
  String? userId;
  Data? data;
  String? message;

  SignUpModel({this.success, this.userId, this.data, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['userId'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['userId'] = this.userId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? email;
  String? username;

  Data({this.email, this.username});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    return data;
  }
}
