class Doctor {
  String id;
  final String name;
  final String specialist;
  final String imageURL;

  Doctor({
    this.id = '',
    required this.name,
    required this.specialist,
    required this.imageURL,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'specialist': specialist,
        'imageURL': imageURL,
      };

  static Doctor fromJson(Map<String, dynamic> json) => Doctor(
        id: json['id'],
        name: json['name'],
        specialist: json['specialist'],
        imageURL: json['imageURL'],
      );
}
