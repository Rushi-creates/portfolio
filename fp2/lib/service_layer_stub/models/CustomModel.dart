// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class CustomModel {
  String title;
  String description;
  File image;
  CustomModel({
    required this.title,
    required this.description,
    required this.image,
  });

  CustomModel copyWith({
    String? title,
    String? description,
    File? image,
  }) {
    return CustomModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory CustomModel.fromMap(Map<String, dynamic> map) {
    return CustomModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as File,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomModel.fromJson(String source) =>
      CustomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomModel(title: $title, description: $description, image: $image)';

  @override
  bool operator ==(covariant CustomModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ image.hashCode;
}
