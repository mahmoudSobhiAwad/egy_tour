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
}
