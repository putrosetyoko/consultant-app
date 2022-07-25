class User {
  String id;
  final String name;
  final String email;
  String avatarURL;

  User({
    this.id = '',
    required this.name,
    required this.email,
    this.avatarURL = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'avatarURL': avatarURL,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        avatarURL: json['avatarURL'],
      );
}
