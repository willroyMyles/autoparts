import 'dart:convert';

class OfferModel {
  String id;
  String message;
  String senderId;
  String recieverId;
  String postId;

  OfferModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.recieverId,
    required this.postId,
  });
  OfferModel copyWith({
    String? id,
    String? message,
    String? senderId,
    String? recieverId,
    String? postId,
  }) {
    return OfferModel(
      id: id ?? this.id,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      recieverId: recieverId ?? this.recieverId,
      postId: postId ?? this.postId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'senderId': senderId,
      'recieverId': recieverId,
      'postId': postId,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      id: map['id'],
      message: map['message'],
      senderId: map['senderId'],
      recieverId: map['recieverId'],
      postId: map['postId'],
    );
  }
  String toJson() => json.encode(toMap());
  factory OfferModel.fromJson(String source) =>
      OfferModel.fromMap(json.decode(source));
  @override
  String toString() {
    return 'OfferModel(id: $id, message: $message, senderId: $senderId, recieverId: $recieverId, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfferModel &&
        other.id == id &&
        other.message == message &&
        other.senderId == senderId &&
        other.recieverId == recieverId &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        message.hashCode ^
        senderId.hashCode ^
        recieverId.hashCode ^
        postId.hashCode;
  }
}
