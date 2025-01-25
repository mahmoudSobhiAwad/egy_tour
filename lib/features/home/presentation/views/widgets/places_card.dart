// import 'package:egy_tour/core/utils/theme/font_styles.dart';
// import 'package:egy_tour/features/home/data/models/place_model.dart';
// import 'package:flutter/material.dart';

// import '../../../../../core/utils/constants/constant_variables.dart';
// import '../../../../../core/utils/theme/app_colors.dart';

// class PlaceCard extends StatefulWidget {
//   final String name;

//   final String location;

//   final String imageUrl;

//   bool isFavorite;

//   PlaceCard(
//       {super.key,
//       required this.name,
//       required this.location,
//       required this.imageUrl,
//       required this.isFavorite});

//   @override
//   State<PlaceCard> createState() => _PlaceCardState();
// }

// class _PlaceCardState extends State<PlaceCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.lightGrey2,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withAlpha(20),
//               blurRadius: 3,
//               spreadRadius: 2,
//             )
//           ],
//           borderRadius: BorderRadius.all(
//             Radius.circular(12),
//           ),
//         ),
//         width: 180,
//         height: 250,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   child: Image.asset(
//                     widget.imageUrl,
//                     width: 160,
//                     height: 126,
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 15.0),
//               child: Text(
//                 widget.name,
//                 style: AppTextStyles.regular16,
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.location_on_outlined,
//                     color: AppColors.darkGrey,
//                   ),
//                   Text(
//                     widget.location,
//                     style: TextStyle(
//                         color: AppColors.darkGrey,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16),
//                   ),
//                   Spacer(),
//                   IconButton(
//                     onPressed: () {
//                       widget.isFavorite = !widget.isFavorite;
//                       setState(() {});
//                       widget.isFavorite
//                           ? favorites.remove(
//                               Place(
//                                   name: widget.name,
//                                   location: widget.location,
//                                   imageUrl: widget.imageUrl,
//                                   isFavorite: widget.isFavorite),
//                             )
//                           : favorites.add(
//                               Place(
//                                   name: widget.name,
//                                   location: widget.location,
//                                   imageUrl: widget.imageUrl,
//                                   isFavorite: widget.isFavorite),
//                             );
//                     },
//                     icon: widget.isFavorite
//                         ? Icon(
//                             Icons.favorite,
//                             color: Colors.red,
//                           )
//                         : Icon(
//                             Icons.favorite_outline,
//                             color: AppColors.darkGrey,
//                           ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
