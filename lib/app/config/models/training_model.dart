import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingModel {
  String id;
  String title;
  String description;
  List<String> categories;
  String author;
  String duration;
  double price;
  String trailerVid;
  String image;
  List<String>? tags;
  Timestamp creationDate;

  TrainingModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.categories,
      required this.author,
      required this.duration,
      required this.price,
      required this.trailerVid,
      required this.image,
      this.tags,
      required this.creationDate});

  factory TrainingModel.fromJson(Map<String, dynamic> map, String id) {
    return TrainingModel(
        id: id,
        title: map['title'],
        description: map['description'],
        categories: List<String>.from(map['categories']),
        author: map['author'],
        duration: map['duration'],
        price: map['price'],
        trailerVid: map['trailerVid'],
        image: map['image'],
        tags: List<String>.from(map['tags']),
        creationDate: map['creationDate']);
  }

  toJson() {
    return {
      "title": title,
      "description": description,
      "categories": categories,
      "author": author,
      "duration": duration,
      "price": price,
      "trailerVid": trailerVid,
      "image": image,
      "tags": tags,
      "creationDate": creationDate
    };
  }
}
