import 'dart:convert';

class QuestionModel {
  String id;
  String content;
  String postId;
  String userInfoId;

  QuestionModel({
    required this.id,
    required this.content,
    required this.postId,
    required this.userInfoId,
  });
  QuestionModel copyWith({
    String? id,
    String? content,
    String? postId,
    String? userInfoId,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      content: content ?? this.content,
      postId: postId ?? this.postId,
      userInfoId: userInfoId ?? this.userInfoId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'postId': postId,
      'userInfoId': userInfoId,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'],
      content: map['content'],
      postId: map['postId'],
      userInfoId: map['userInfoId'],
    );
  }
  String toJson() => json.encode(toMap());
  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
  factory QuestionModel.empty() =>
      QuestionModel(id: "0", content: "", postId: "", userInfoId: "");
  @override
  String toString() {
    return 'QuestionModel(id: $id, content: $content, postId: $postId, userInfoId: $userInfoId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.id == id &&
        other.content == content &&
        other.postId == postId &&
        other.userInfoId == userInfoId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        postId.hashCode ^
        userInfoId.hashCode;
  }
}
