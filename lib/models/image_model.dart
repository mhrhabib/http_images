class ImageModel {
  late int id;
  late String url;
  late String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}

// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

// import 'dart:convert';

// Country countryFromJson(String str) => Country.fromJson(json.decode(str));

// String countryToJson(Country data) => json.encode(data.toJson());

// class Country {
//     Country({
//         required this.albumId,
//         required this.id,
//         required this.title,
//         required this.url,
//          required this.thumbnailUrl,
//     });

//     int albumId;
//     int id;
//     String title;
//     String url;
//     String thumbnailUrl;

//     factory Country.fromJson(Map<String, dynamic> json) => Country(
//         albumId: json["albumId"],
//         id: json["id"],
//         title: json["title"],
//         url: json["url"],
//         thumbnailUrl: json["thumbnailUrl"],
//     );

//     Map<String, dynamic> toJson() => {
//         "albumId": albumId,
//         "id": id,
//         "title": title,
//         "url": url,
//         "thumbnailUrl": thumbnailUrl,
//     };
// }
