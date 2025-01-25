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
}
