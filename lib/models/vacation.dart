class Vacation {
  final int id;
  final String name;
  final List<String> tags;
  final String photUrl;
  final String text;

  const Vacation({
    required this.id,
    required this.name,
    required this.tags,
    required this.photUrl,
    required this.text,
  });

  static Vacation fromJson(json) => Vacation(
        id: json['id'],
        name: json['name'],
        tags: List<String>.from(json["tags"].map((x) => x)),
        photUrl: json['photUrl'],
        text: json['text'],
      );
}

