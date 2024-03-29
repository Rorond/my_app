import 'created.dart';
import 'user.dart';

class Articles {
  String? uuid;
  String? title;
  String? content;
  String? image;
  int? views;
  Created? created;
  User? user;

  Articles({
    this.uuid,
    this.title,
    this.content,
    this.image,
    this.views,
    this.created,
    this.user,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        uuid: json['uuid'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        image: json['image'] as String?,
        views: json['views'] as int?,
        created: json['created'] == null
            ? null
            : Created.fromJson(json['created'] as Map<String, dynamic>),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'title': title,
        'content': content,
        'image': image,
        'views': views,
        'created': created?.toJson(),
        'user': user?.toJson(),
      };
}
