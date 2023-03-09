import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String id;
  final String name;

  final String place;

  const User({
    this.place = '',
    this.email = '',
    this.id = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'name': name,
      'place': place,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        email: map['email'] ?? "",
        id: map['id'] ?? "",
        name: map['name'] ?? "",
        place: map['place'] ?? "");
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  @override
  List<Object?> get props => [email, id, name, place];
}
