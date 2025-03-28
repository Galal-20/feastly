class UserEntity {
  final String name;
  final String phone;
  final String email;
  final String? image;

  UserEntity({
    required this.name,
    required this.phone,
    required this.email,
    this.image,
  });

  UserEntity copyWith({
    String? name,
    String? phone,
    String? email,
    String? image,
  }) {
    return UserEntity(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
