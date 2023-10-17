class UserData {
  String? uid;
  String? email;
  String? username;
  String? docId;

  UserData({this.uid, this.email, this.username, this.docId});

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    username = json['username'];
    docId = json['docId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['username'] = this.username;
    data['docId'] = this.docId;
    return data;
  }
}
