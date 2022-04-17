import 'dart:convert';

class AnswerModel {
  String id;
  String content;
  String postId;
  String userInfoId;
  String questionId;
  AnswerModel({
    required this.id,
    required this.content,
    required this.postId,
    required this.userInfoId,
    required this.questionId,
  });
  AnswerModel copyWith({
    String? id,
    String? content,
    String? postId,
    String? userInfoId,
    String? questionId,
  }) {
    return AnswerModel(
      id: id ?? this.id,
      content: content ?? this.content,
      postId: postId ?? this.postId,
      userInfoId: userInfoId ?? this.userInfoId,
      questionId: questionId ?? this.questionId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'postId': postId,
      'userInfoId': userInfoId,
      'questionId': questionId,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      id: map['id'],
      content: map['content'],
      postId: map['postId'],
      userInfoId: map['userInfoId'],
      questionId: map['questionId'],
    );
  }
  String toJson() => json.encode(toMap());
  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnswerModel(id: $id, content: $content, postId: $postId, userInfoId: $userInfoId, questionId: $questionId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnswerModel &&
        other.id == id &&
        other.content == content &&
        other.postId == postId &&
        other.userInfoId == userInfoId &&
        other.questionId == questionId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        postId.hashCode ^
        userInfoId.hashCode ^
        questionId.hashCode;
  }
}
