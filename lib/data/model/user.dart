import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String gender;
  final String email;
  final String phone;
  final Name name;

  const User({this.gender = '', this.email = '', this.phone = '', required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: Name.fromJson(json['name']),
        phone: json['phone'],
        email: json['email'],
        gender: json['gender']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;

    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [gender, name, phone, name];
}

class Name extends Equatable {
  final String title;
  final String first;
  final String? last;

  String get fullName => '$title $first $last';

  const Name(this.title, this.first, this.last);

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(json['title'], json['first'], json['last']);
  }

  factory Name.fromString(String name) {
    final nameSplit = name.split(' ');
    return Name(name.length > 1 ? nameSplit.first : '', name.length > 2 ? nameSplit[1] : '',
        name.length >= 3 ? nameSplit[2] : '');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }

  @override
  List<Object?> get props => [title, first, last];
}
