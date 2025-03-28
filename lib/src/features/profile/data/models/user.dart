import 'package:feastly/src/features/profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String? image;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    this.image,
  }) : super(
          name: name,
          phone: phone,
          email: email,
          image: image,
        );
  @override
  UserModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? image,
  }) {
    return UserModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
    };
  }
}
