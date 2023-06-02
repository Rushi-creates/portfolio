// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'MovieResults.dart';
import 'SeriesResult.dart';
import 'SongResults.dart';
import 'YoutubeSingleResult.dart';

class FollowingPosts {
  int? id;
  String api_id;
  String trendType;
  String watchedAt;
  String message;
  String lovedFact;
  String createdAt;
  int profile_fk;
  String profile_username;
  String profile_bio;
  String userAcc_photoUrl;
  SongResults? songResults;
  MovieResults? movieResults;
  SeriesResults? seriesResults;
  YoutubeSingleResult? youtubeSingleResult;
  FollowingPosts({
    this.id,
    required this.api_id,
    required this.trendType,
    required this.watchedAt,
    required this.message,
    required this.lovedFact,
    required this.createdAt,
    required this.profile_fk,
    required this.profile_username,
    required this.profile_bio,
    required this.userAcc_photoUrl,
    this.songResults,
    this.movieResults,
    this.seriesResults,
    this.youtubeSingleResult,
  });

  FollowingPosts copyWith({
    int? id,
    String? api_id,
    String? trendType,
    String? watchedAt,
    String? message,
    String? lovedFact,
    String? createdAt,
    int? profile_fk,
    String? profile_username,
    String? profile_bio,
    String? userAcc_photoUrl,
    SongResults? songResults,
    MovieResults? movieResults,
    SeriesResults? seriesResults,
    YoutubeSingleResult? youtubeSingleResult,
  }) {
    return FollowingPosts(
      id: id ?? this.id,
      api_id: api_id ?? this.api_id,
      trendType: trendType ?? this.trendType,
      watchedAt: watchedAt ?? this.watchedAt,
      message: message ?? this.message,
      lovedFact: lovedFact ?? this.lovedFact,
      createdAt: createdAt ?? this.createdAt,
      profile_fk: profile_fk ?? this.profile_fk,
      profile_username: profile_username ?? this.profile_username,
      profile_bio: profile_bio ?? this.profile_bio,
      userAcc_photoUrl: userAcc_photoUrl ?? this.userAcc_photoUrl,
      songResults: songResults ?? this.songResults,
      movieResults: movieResults ?? this.movieResults,
      seriesResults: seriesResults ?? this.seriesResults,
      youtubeSingleResult: youtubeSingleResult ?? this.youtubeSingleResult,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'api_id': api_id,
      'trendType': trendType,
      'watchedAt': watchedAt,
      'message': message,
      'lovedFact': lovedFact,
      'createdAt': createdAt,
      'profile_fk': profile_fk,
      'profile_username': profile_username,
      'profile_bio': profile_bio,
      'userAcc_photoUrl': userAcc_photoUrl,
      'songResults': songResults?.toMap(),
      'movieResults': movieResults?.toJson(),
      'seriesResults': seriesResults?.toJson(),
      'youtubeSingleResult': youtubeSingleResult?.toMap(),
    };
  }

  factory FollowingPosts.fromMap(Map<String, dynamic> map) {
    return FollowingPosts(
      id: map['id'] != null ? map['id'] as int : null,
      api_id: map['api_id'] as String,
      trendType: map['trendType'] as String,
      watchedAt: map['watchedAt'] as String,
      message: map['message'] as String,
      lovedFact: map['lovedFact'] as String,
      createdAt: map['createdAt'] as String,
      profile_fk: map['profile_fk'] as int,
      profile_username: map['profile_username'] as String,
      profile_bio: map['profile_bio'] as String,
      userAcc_photoUrl: map['userAcc_photoUrl'] as String,
      songResults: map['songResults'] != null
          ? SongResults.fromMap(map['songResults'] as Map<String, dynamic>)
          : null,
      movieResults: map['movieResults'] != null
          ? MovieResults.fromJson(map['movieResults'] as Map<String, dynamic>)
          : null,
      seriesResults: map['seriesResults'] != null
          ? SeriesResults.fromJson(map['seriesResults'] as Map<String, dynamic>)
          : null,
      youtubeSingleResult: map['youtubeSingleResult'] != null
          ? YoutubeSingleResult.fromMap(
              map['youtubeSingleResult'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList =
        parsedJsonList.map((i) => FollowingPosts.fromMap(i)).toList();
    return dartObjList;
  }

  factory FollowingPosts.fromJson(String source) =>
      FollowingPosts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FollowingPosts(id: $id, api_id: $api_id, trendType: $trendType, watchedAt: $watchedAt, message: $message, lovedFact: $lovedFact, createdAt: $createdAt, profile_fk: $profile_fk, profile_username: $profile_username, profile_bio: $profile_bio, userAcc_photoUrl: $userAcc_photoUrl, songResults: $songResults, movieResults: $movieResults, seriesResults: $seriesResults, youtubeSingleResult: $youtubeSingleResult)';
  }

  @override
  bool operator ==(covariant FollowingPosts other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.api_id == api_id &&
        other.trendType == trendType &&
        other.watchedAt == watchedAt &&
        other.message == message &&
        other.lovedFact == lovedFact &&
        other.createdAt == createdAt &&
        other.profile_fk == profile_fk &&
        other.profile_username == profile_username &&
        other.profile_bio == profile_bio &&
        other.userAcc_photoUrl == userAcc_photoUrl &&
        other.songResults == songResults &&
        other.movieResults == movieResults &&
        other.seriesResults == seriesResults &&
        other.youtubeSingleResult == youtubeSingleResult;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        api_id.hashCode ^
        trendType.hashCode ^
        watchedAt.hashCode ^
        message.hashCode ^
        lovedFact.hashCode ^
        createdAt.hashCode ^
        profile_fk.hashCode ^
        profile_username.hashCode ^
        profile_bio.hashCode ^
        userAcc_photoUrl.hashCode ^
        songResults.hashCode ^
        movieResults.hashCode ^
        seriesResults.hashCode ^
        youtubeSingleResult.hashCode;
  }
}
