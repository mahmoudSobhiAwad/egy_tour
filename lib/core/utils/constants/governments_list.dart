import 'package:egy_tour/features/governments/data/models/government_model.dart';
import 'package:egy_tour/features/governments/data/models/land_mark_model.dart';

List<LandmarkModel> popLandmarksList = [
  LandmarkModel(
    uniqueId: '0',
    title: "Citadel of Qaitbay",
    imageUrl: "assets/images/Citadel_of_Qaitbay.jpg",
    governName: "Alexandria, Egypt",
    isFavorite: false,
    latitude: 31.2135,
    longitude: 29.8856,
  ),
  LandmarkModel(
    uniqueId: '2',
    title: "Pyramids of Giza",
    imageUrl: "assets/images/pyramids.jpg",
    governName: "Giza, Egypt",
    isFavorite: false,
    latitude: 29.9792,
    longitude: 31.1342,
  ),
  LandmarkModel(
    uniqueId: '4',
    title: "Karnak Temple",
    imageUrl: "assets/images/Karnak_Temple.jpg",
    governName: "Luxor, Egypt",
    isFavorite: false,
    latitude: 25.7188,
    longitude: 32.6573,
  ),
];
List<LandmarkModel> suggestedLandmarksList = [
  LandmarkModel(
    uniqueId: '5',
    title: "Queen Hatshepsut Temple",
    imageUrl: "assets/images/Queen_Hatshepsut_Temple.jpg",
    governName: "Luxor, Egypt",
    isFavorite: false,
    latitude: 25.7378,
    longitude: 32.6064,
  ),
  LandmarkModel(
    uniqueId: '1',
    title: "Al Montazah Palace",
    imageUrl: "assets/images/Al_Montazah_Palace.jpg",
    governName: "Alexandria,\n Egypt",
    isFavorite: false,
    latitude: 31.2885,
    longitude: 30.0128,
  ),
  LandmarkModel(
    uniqueId: '3',
    title: "The Sphinx",
    imageUrl: "assets/images/sphinx.jfif",
    governName: "Giza, Egypt",
    isFavorite: false,
    latitude: 29.9753,
    longitude: 31.1376,
  ),
];

List<GovernmentModel> governmentsList = [
  GovernmentModel(
    description:
        "A bustling coastal city with a rich history, once home to the legendary Library of Alexandria and the ancient Lighthouse of The Pharaohs.",
    imageUrl: "assets/images/Flag_of_Alexandria.png",
    name: "Alexandria, Egypt",
    governId: '0',
    landMarkList: [
      LandmarkModel(
        uniqueId: '0',
        title: "Citadel of Qaitbay",
        imageUrl: "assets/images/Citadel_of_Qaitbay.jpg",
        governName: "Alexandria,\n Egypt",
        isFavorite: false,
        latitude: 31.2135,
        longitude: 29.8856,
      ),
      LandmarkModel(
        uniqueId: '1',
        title: "Al Montazah Palace",
        imageUrl: "assets/images/Al_Montazah_Palace.jpg",
        governName: "Alexandria,\n Egypt",
        isFavorite: false,
        latitude: 31.2885,
        longitude: 30.0128,
      ),
    ],
  ),
  GovernmentModel(
    description:
        "A vibrant metropolis known for its rich history and proximity to iconic landmarks like the Great Pyramids of Giza and the Sphinx.",
    imageUrl: "assets/images/Flag_of_Giza_Governorate.png",
    name: "Giza, Egypt",
    governId: '1',
    landMarkList: [
      LandmarkModel(
        uniqueId: '2',
        title: "Pyramids of Giza",
        imageUrl: "assets/images/pyramids.jpg",
        governName: "Giza, Egypt",
        isFavorite: false,
        latitude: 29.9792,
        longitude: 31.1342,
      ),
      LandmarkModel(
        uniqueId: '3',
        title: "The Sphinx",
        imageUrl: "assets/images/sphinx.jfif",
        governName: "Giza, Egypt",
        isFavorite: false,
        latitude: 29.9753,
        longitude: 31.1376,
      ),
    ],
  ),
  GovernmentModel(
    description:
        "Referred to as the \"world's greatest open-air museum,\" is renowned for its ancient monuments, including the Valley of the Kings, Karnak Temple, and Luxor Temple.",
    imageUrl: "assets/images/Flag_of_Luxor_Governorate.png",
    name: "Luxor, Egypt",
    governId: '2',
    landMarkList: [
      LandmarkModel(
        uniqueId: '4',
        title: "Karnak Temple",
        imageUrl: "assets/images/Karnak_Temple.jpg",
        governName: "Luxor, Egypt",
        isFavorite: false,
        latitude: 25.7188,
        longitude: 32.6573,
      ),
      LandmarkModel(
        uniqueId: '5',
        title: "Queen Hatshepsut Temple",
        imageUrl: "assets/images/Queen_Hatshepsut_Temple.jpg",
        governName: "Luxor, Egypt",
        isFavorite: false,
        latitude: 25.7378,
        longitude: 32.6064,
      ),
    ],
  ),
];

List<GovernmentModel> moreGovernmentsList = [
  GovernmentModel(
    description:
        "A breathtaking region where dramatic mountains meet stunning coastal beaches, rich in historical significance and natural beauty.",
    imageUrl: "assets/images/Flag_of_South_Sinai_Governorate.png",
    name: "Sinai, Egypt",
    governId: '3',
    landMarkList: [
      LandmarkModel(
        uniqueId: '6',
        title: "Jabal Mousa",
        imageUrl: "assets/images/Jabal_Mousa.jpg",
        governName: "Sinai, Egypt",
        isFavorite: false,
        latitude: 28.5394,
        longitude: 33.9756,
      ),
      LandmarkModel(
        uniqueId: '7',
        title: "Ras Mohamed",
        imageUrl: "assets/images/Ras_Mohamed.jpg",
        governName: "Sinai, Egypt",
        isFavorite: false,
        latitude: 27.7229,
        longitude: 34.2583,
      ),
    ],
  ),
  GovernmentModel(
      description:
          "A serene and picturesque city along the Nile River, known for impressive archaeological sites, colorful Nubian culture, and the stunning Aswan High Dam.",
      imageUrl: "assets/images/Flag_of_Aswan_Governorate.png",
      name: "Aswan, Egypt",
      landMarkList: [
        LandmarkModel(
          uniqueId: '8',
          title: "Kom Ombo Temple",
          imageUrl: "assets/images/Kom_Ombo_Temple.jpg",
          governName: "Aswan, Egypt",
          isFavorite: false,
          latitude: 24.4689,
          longitude: 32.9576,
        ),
        LandmarkModel(
          uniqueId: '9',
          title: "High Dam",
          imageUrl: "assets/images/High_Dam.jpg",
          governName: "Aswan, Egypt",
          isFavorite: false,
          latitude: 24.0841,
          longitude: 32.8844,
        ),
      ],
      governId: '4'),
];
