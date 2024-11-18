class User {
  final String name;
  final String nickname;
  final DateTime birthday;
  final String phone;
  final String email;

  User({
    required this.name,
    required this.nickname,
    required this.birthday,
    required this.phone,
    required this.email,
  });

  // Construtor para criação a partir de JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      nickname: json['nickname'],
      birthday: DateTime.parse(json['birthday']),
      phone: json['phone'],
      email: json['email'],
    );
  }

  // Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'birthday': birthday.toIso8601String(),
      'phone': phone,
      'email': email,
    };
  }

  // Cria uma cópia do usuário com possíveis alterações
  User copyWith({
    String? name,
    String? nickname,
    DateTime? birthday,
    String? phone,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      birthday: birthday ?? this.birthday,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }
}
