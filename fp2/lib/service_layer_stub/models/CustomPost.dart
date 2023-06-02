// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomPost {
  int? id;
  String title;
  String description;
  String imageUrl;
  String createdAt;
  int profile_fk;
  CustomPost({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
    required this.profile_fk,
  });

  CustomPost copyWith({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    String? createdAt,
    int? profile_fk,
  }) {
    return CustomPost(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      profile_fk: profile_fk ?? this.profile_fk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'profile_fk': profile_fk,
    };
  }

  factory CustomPost.fromMap(Map<String, dynamic> map) {
    return CustomPost(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      createdAt: map['createdAt'] as String,
      profile_fk: map['profile_fk'] as int,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList =
        parsedJsonList.map((i) => CustomPost.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory CustomPost.fromJson(String source) =>
      CustomPost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomPost(id: $id, title: $title, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, profile_fk: $profile_fk)';
  }

  @override
  bool operator ==(covariant CustomPost other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.createdAt == createdAt &&
        other.profile_fk == profile_fk;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        createdAt.hashCode ^
        profile_fk.hashCode;
  }
}
