class User {
  String id;
  final String name;
  final String email;
  String? photoURL;

  User({
    this.id = '',
    required this.name,
    required this.email,
    this.photoURL,
  }) {
    photoURL ??=
        'https://firebasestorage.googleapis.com/v0/b/consultantapp-firebase.appspot.com/o/app%2Fdefault_profile.jpg?alt=media&token=bd618b19-ff4d-4916-adac-53ee63d98c60';
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photoURL': photoURL,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        photoURL: json['photoURL'],
      );
}
