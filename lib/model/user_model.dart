class UserModel {
  String userId;
  String userName;
  String userPhone;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userPhone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      userPhone: map['userPhone'] as String,
    );
  }
}
