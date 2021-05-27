// To parse this JSON data, do
//
//     final script = scriptFromJson(jsonString);

import 'dart:convert';

Script scriptFromJson(String str) => Script.fromJson(json.decode(str));

String scriptToJson(Script data) => json.encode(data.toJson());

class Script {
  Script({
    this.scriptId,
    this.authorId,
    this.title,
    this.body,
    this.tags,
    this.isPrivate,
    this.isForkable,
    this.toSponsor,
  });

  String scriptId;
  String authorId;
  String title;
  String body;
  List<String> tags;
  bool isPrivate;
  bool isForkable;
  bool toSponsor;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        scriptId: json["script_id"],
        authorId: json["author_id"],
        title: json["title"],
        body: json["body"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        isPrivate: json["is_private"],
        isForkable: json["is_forkable"],
        toSponsor: json["to_sponsor"],
      );

  Map<String, dynamic> toJson() => {
        "script_id": scriptId,
        "author_id": authorId,
        "title": title,
        "body": body,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "is_private": isPrivate,
        "is_forkable": isForkable,
        "to_sponsor": toSponsor,
      };
}
