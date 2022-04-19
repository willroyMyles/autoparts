import 'dart:convert';

class UserInfo {
  String userId;
  String id;
  String username;
  String userImageUrl;
  String email;
  String alias;
  String postId;
  DateTime createdAt;

  UserInfo({
    required this.userId,
    required this.id,
    required this.username,
    required this.userImageUrl,
    required this.email,
    required this.alias,
    required this.postId,
    required this.createdAt,
  });
  UserInfo copyWith({
    String? userId,
    String? id,
    String? username,
    String? userImageUrl,
    String? email,
    String? alias,
    String? postId,
    DateTime? createdAt,
  }) {
    return UserInfo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      username: username ?? this.username,
      userImageUrl: userImageUrl ?? this.userImageUrl,
      email: email ?? this.email,
      alias: alias ?? this.alias,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'username': username,
      'userImageUrl': userImageUrl,
      'email': email,
      'alias': alias,
      'postId': postId,
      'createdAt': createdAt.toString(),
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      userId: map['userId'],
      id: map['id'],
      username: map['username'],
      userImageUrl: map['userImageUrl'],
      email: map['email'],
      alias: map['alias'] ?? "",
      postId: map['postId'] ?? "",
      createdAt: DateTime.tryParse(map['createdAt']) ?? DateTime.now(),
    );
  }
  String toJson() => json.encode(toMap());
  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source));
  factory UserInfo.empty() => UserInfo(
      userId: "",
      id: "",
      username: "",
      userImageUrl: "",
      email: "",
      alias: "",
      postId: "",
      createdAt: DateTime.now());

  factory UserInfo.post(Map<String, dynamic> map) {
    var user = UserInfo.empty();
    user.id = map["id"];
    user.username = map["username"];
    user.userImageUrl = map["userImageUrl"];
    return user;
  }
  @override
  String toString() {
    return 'UserInfo(userId: $userId, id: $id, username: $username, userImageUrl: $userImageUrl, email: $email, alias: $alias, postId: $postId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfo &&
        other.userId == userId &&
        other.id == id &&
        other.username == username &&
        other.userImageUrl == userImageUrl &&
        other.email == email &&
        other.alias == alias &&
        other.postId == postId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        id.hashCode ^
        username.hashCode ^
        userImageUrl.hashCode ^
        email.hashCode ^
        alias.hashCode ^
        postId.hashCode ^
        createdAt.hashCode;
  }
}
