import 'package:cloud_firestore/cloud_firestore.dart';

class LandmarkModel {
  final String title;
  final String imageUrl;
  final String governName;
  final String uniqueId;
  bool isFavorite;
  // Add Latitude and Longitude properties
  final double latitude;
  final double longitude;

  LandmarkModel({
    required this.title,
    required this.imageUrl,
    required this.governName,
    required this.uniqueId,
    required this.isFavorite,
    required this.latitude,
    required this.longitude,
  });

  factory LandmarkModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? snapShotOptions,
  ) {
    final data = snapshot.data();
    return LandmarkModel(
      title: data?["title"] ?? '',
      imageUrl: data?["imageUrl"] ?? '',
      governName: data?["governName"] ?? '',
      uniqueId: data?["uniqueId"] ?? '',
      isFavorite: data?["isFavorite"] ?? false,
      latitude: (data?["latitude"] ?? 0.0).toDouble(),
      longitude: (data?["longitude"] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "imageUrl": imageUrl,
      "governName": governName,
      "uniqueId": uniqueId,
      "isFavorite": isFavorite,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
