// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:timeago/timeago.dart' as timeago;

import 'package:wrg3/backend/models/model.userInfo.dart';
import 'package:wrg3/backend/services/service.information.dart';

import '../enums/enum.status.dart';

class PostModel {
  String title = "";
  String id = "";
  String content = "";
  String category = "";
  String make = "";
  String model = "";
  int year = 0;
  int views = 0;
  int watching = 0;
  int commentss = 0;
  DateTime? createdAt;
  String? userInfoId;
  UserInfo? userInfo;
  // UserInfoModel userInfo;
  Status status = Status.OPEN;
  PostModel({
    required this.title,
    required this.id,
    required this.content,
    required this.category,
    required this.make,
    required this.model,
    required this.year,
    required this.views,
    required this.watching,
    required this.commentss,
    this.createdAt,
    this.userInfoId,
    this.userInfo,
    required this.status,
  });
  // List<OfferModel> offers = [];

  PostModel copyWith({
    String? title,
    String? id,
    String? content,
    String? category,
    String? make,
    String? model,
    int? year,
    int? views,
    int? watching,
    int? commentss,
    DateTime? createdAt,
    String? userInfoId,
    UserInfo? userInfo,
    Status? status,
  }) {
    return PostModel(
      title: title ?? this.title,
      id: id ?? this.id,
      content: content ?? this.content,
      category: category ?? this.category,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      views: views ?? this.views,
      watching: watching ?? this.watching,
      commentss: commentss ?? this.commentss,
      createdAt: createdAt ?? this.createdAt,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo ?? this.userInfo,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'content': content,
      'category': category,
      'make': make,
      'model': model,
      'year': year,
      'views': views,
      'watching': watching,
      'commentss': commentss,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'userInfoId': userInfoId,
      // 'userInfo': userInfo?.toMap(),
      // 'status': status.toMap(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    var st = Status.values.firstWhere((element) {
      var name = element.name.toUpperCase();
      return name == map["status"];
    });
    return PostModel(
        title: map['title'] as String,
        id: map['id'] as String,
        content: map['content'] as String,
        category: map['category'] as String,
        make: map['make'] as String,
        model: map['model'] as String,
        year: map['year'] as int,
        views: map['views'] as int,
        watching: map['watching'] as int,
        commentss: map['commentss'] as int,
        createdAt: map['createdAt'] != null
            ? DateTime.tryParse(map['createdAt'])
            : null,
        userInfoId:
            map['userInfoId'] != null ? map['userInfoId'] as String : null,
        userInfo: map['UserInfo'] != null
            ? UserInfo.post(map['UserInfo'] as Map<String, dynamic>)
            : null,
        status: st);
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(title: $title, id: $id, content: $content, category: $category, make: $make, model: $model, year: $year, views: $views, watching: $watching, commentss: $commentss, createdAt: $createdAt, userInfoId: $userInfoId, userInfo: $userInfo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.title == title &&
        other.id == id &&
        other.content == content &&
        other.category == category &&
        other.make == make &&
        other.model == model &&
        other.year == year &&
        other.views == views &&
        other.watching == watching &&
        other.commentss == commentss &&
        other.createdAt == createdAt &&
        other.userInfoId == userInfoId &&
        other.userInfo == userInfo &&
        other.status == status;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        content.hashCode ^
        category.hashCode ^
        make.hashCode ^
        model.hashCode ^
        year.hashCode ^
        views.hashCode ^
        watching.hashCode ^
        commentss.hashCode ^
        createdAt.hashCode ^
        userInfoId.hashCode ^
        userInfo.hashCode ^
        status.hashCode;
  }

  String get getCreateDate => timeago.format(createdAt!);
  bool get isOwner =>
      infoService.isSignedIn.value &&
      userInfoId == infoService.userInfo.value.userId;
}
