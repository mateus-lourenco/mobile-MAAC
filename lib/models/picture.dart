import 'dart:convert';

class Picture {
  int id;
  String name;
  String description;
  String author;
  String image;

  Picture({
    this.id = 0,
    this.name,
    this.description,
    this.author,
    this.image,
  });

  factory Picture.fromJson(Map<String, dynamic> map) {
    return Picture(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        author: map["author"],
        image: map["image"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "author": author,
      "image": image
    };
  }

  @override
  String toString() {
    return "Picture{id: $id, name: $name, description: $description, author: $author, image: $image}";
  }
}

List<Picture> pictureFromJson(String dataJson) {
  final picture = json.decode(dataJson);
  return List<Picture>.from(picture.map((item) => Picture.fromJson(item)));
}

String pictureToJson(Picture picture) {
  final dataJson = picture.toJson();
  return json.encode(dataJson);
}
