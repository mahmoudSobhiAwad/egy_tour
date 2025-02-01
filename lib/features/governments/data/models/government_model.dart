import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

class GovernmentModel {
  String name;
  String description;
  String governId;
  String imageUrl;
  List<LandmarkModel> landMarkList;
  GovernmentModel(
      {required this.description,
      required this.imageUrl,
      required this.name,
      required this.governId,
      required this.landMarkList});
  factory GovernmentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? snapShotOptions,
  ) {
    final data = snapshot.data();
    return GovernmentModel(
      description: data?["description"],
      imageUrl: data?["imageUrl"],
      name: data?["name"],
      governId: data?["governId"],
      landMarkList: data?["landMarkList"],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "description": description,
      "imageUrl": imageUrl,
      "name": name,
      "governId": governId,
      "landMarkList": landMarkList,
    };
  }
}
