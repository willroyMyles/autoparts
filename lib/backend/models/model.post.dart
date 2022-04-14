import 'dart:convert';

import '../enums/enum.status.dart';
import 'package:timeago/timeago.dart' as timeago;

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
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});
    result.addAll({'content': content});
    result.addAll({'category': category});
    result.addAll({'make': make});
    result.addAll({'model': model});
    result.addAll({'year': year});
    result.addAll({'views': views});
    result.addAll({'watching': watching});
    result.addAll({'commentss': commentss});
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }
    if (userInfoId != null) {
      result.addAll({'userInfoId': userInfoId});
    }
    // result.addAll({'status': status.toMap()});

    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    var st = Status.values.firstWhere((element) {
      var name = element.name.toUpperCase();
      return name == map["status"];
    });

    return PostModel(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      category: map['category'] ?? '',
      make: map['make'] ?? '',
      model: map['model'] ?? '',
      year: map['year']?.toInt() ?? 0,
      views: map['views']?.toInt() ?? 0,
      watching: map['watching']?.toInt() ?? 0,
      commentss: map['commentss']?.toInt() ?? 0,
      createdAt:
          map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      userInfoId: map['userInfoId'],
      status: st,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(title: $title, id: $id, content: $content, category: $category, make: $make, model: $model, year: $year, views: $views, watching: $watching, commentss: $commentss, createdAt: $createdAt, userInfoId: $userInfoId, status: $status)';
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
        status.hashCode;
  }

  String get getCreateDate => timeago.format(createdAt!);
}
