import 'package:cloud_firestore/cloud_firestore.dart';

class LandmarkModel {
  final String title;
  final String imageUrl;
  final String governName;
  final String uniqueId;
  bool isFavorite;

  LandmarkModel(
      {required this.title,
      required this.imageUrl,
      required this.governName,
      required this.uniqueId,
      required this.isFavorite});

  factory LandmarkModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? snapShotOptions,
  ) {
    final data = snapshot.data();
    return LandmarkModel(
      title: data?["title"],
      imageUrl: data?["imageUrl"],
      governName: data?["governName"],
      uniqueId: data?["uniqueId"],
      isFavorite: data?["isFavorite"],
    );
  }
}
