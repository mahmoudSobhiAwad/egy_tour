import 'package:egy_tour/features/governments/data/models/government_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

List<LandmarkModel> popLandmarksList = [
  LandmarkModel(
      uniqueId: '0',
      title: "Citadel of Qaitbay",
      imageUrl: "assets/images/Citadel_of_Qaitbay.jpg",
      governName: "Alexandria,\n Egypt",
      isFavorite: false),
  LandmarkModel(
      uniqueId: '2',
      title: "Pyramids of Giza",
      imageUrl: "assets/images/pyramids.jpg",
      governName: "Giza, Egypt",
      isFavorite: false),
  LandmarkModel(
      uniqueId: '4',
      title: "Karnak Temple",
      imageUrl: "assets/images/Karnak_Temple.jpg",
      governName: "Luxor, Egypt",
      isFavorite: false),
];
List<LandmarkModel> suggestedLandmarksList = [
  LandmarkModel(
      uniqueId: '5',
      title: "Queen Hatshepsut Temple",
      imageUrl: "assets/images/Queen_Hatshepsut_Temple.jpg",
      governName: "Luxor, Egypt",
      isFavorite: false),
  LandmarkModel(
      uniqueId: '1',
      title: "Al Montazah Palace",
      imageUrl: "assets/images/Al_Montazah_Palace.jpg",
      governName: "Alexandria,\n Egypt",
      isFavorite: false),
  LandmarkModel(
      uniqueId: '3',
      title: "The Sphinx",
      imageUrl: "assets/images/sphinx.jfif",
      governName: "Giza, Egypt",
      isFavorite: false),
];

List<GovernmentModel> governmentsList = [
  GovernmentModel(
      description:
          "A bustling coastal city with a rich history, once home to the legendary Library of Alexandria and the ancient Lighthouse of The Pharaohs.",
      imageUrl: "assets/images/Flag_of_Alexandria.png",
      name: "Alexandria, Egypt",
      landMarkList: [
        LandmarkModel(
            uniqueId: '0',
            title: "Citadel of Qaitbay",
            imageUrl: "assets/images/Citadel_of_Qaitbay.jpg",
            governName: "Alexandria,\n Egypt",
            isFavorite: false),
        LandmarkModel(
            uniqueId: '1',
            title: "Al Montazah Palace",
            imageUrl: "assets/images/Al_Montazah_Palace.jpg",
            governName: "Alexandria,\n Egypt",
            isFavorite: false),

      ],
      governId: '0'),
  GovernmentModel(
      description:
          "A vibrant metropolis known for its rich history and proximity to iconic landmarks like the Great Pyramids of Giza and the Sphinx.",
      imageUrl: "assets/images/Flag_of_Giza_Governorate.png",
      name: "Giza, Egypt",
      landMarkList: [
        LandmarkModel(
            uniqueId: '2',
            title: "Pyramids of Giza",
            imageUrl: "assets/images/pyramids.jpg",
            governName: "Giza, Egypt",
            isFavorite: false),
        LandmarkModel(
            uniqueId: '3',
            title: "The Sphinx",
            imageUrl: "assets/images/sphinx.jfif",
            governName: "Giza, Egypt",
            isFavorite: false),
      ],
      governId: '1'),
  GovernmentModel(
      description:
          "Referred to as the \"world's greatest open-air museum,\" is renowned for its ancient monuments, including the Valley of the Kings, Karnak Temple, and Luxor Temple.",
      imageUrl: "assets/images/Flag_of_Luxor_Governorate.png",
      name: "Luxor, Egypt",
      landMarkList: [
        LandmarkModel(
            uniqueId: '4',
            title: "Karnak Temple",
            imageUrl: "assets/images/Karnak_Temple.jpg",
            governName: "Luxor, Egypt",
            isFavorite: false),
        LandmarkModel(
            uniqueId: '5',
            title: "Queen Hatshepsut Temple",
            imageUrl: "assets/images/Queen_Hatshepsut_Temple.jpg",
            governName: "Luxor, Egypt",
            isFavorite: false),
      ],
      governId: '2'),
];
