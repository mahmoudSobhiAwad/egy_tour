import 'package:egy_tour/core/utils/constants/governments_list.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_arrow_back.dart';
import 'package:egy_tour/features/governments/data/models/government_model.dart';
import 'package:egy_tour/features/governments/presentation/views/widgets/landmark_card.dart';
import 'package:flutter/material.dart';

class LandmarkView extends StatefulWidget {
  const LandmarkView({super.key, required this.governmentId});

  final String governmentId;

  @override
  State<LandmarkView> createState() => _LandmarkViewState();
}

class _LandmarkViewState extends State<LandmarkView> {
  late GovernmentModel governmentModel;
  @override
  void initState() {
    governmentModel =
        governmentsList.firstWhere((id) => id.governId == widget.governmentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          spacing: 10,
          children: [
            SizedBox(),
            Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomArrowBackButton(),
                Flexible(
                  child: Text(
                    governmentModel.name,
                    style: AppTextStyles.bold24,
                  ),
                ),
                PopupMenuButton<GovernmentModel>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28,
                    ),
                    itemBuilder: (context) {
                      return [
                        ...List.generate(governmentsList.length, (index) {
                          return PopupMenuItem(
                            onTap: () {
                              setState(() {
                                governmentModel = governmentsList.firstWhere(
                                    (gov) =>
                                        gov.governId ==
                                        governmentsList[index].governId);
                              });
                            },
                            child: Text(
                              governmentsList[index].name,
                              style: AppTextStyles.bold18,
                            ),
                          );
                        })
                      ];
                    })
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                itemCount: governmentModel.landMarkList.length,
                itemBuilder: (context, index) {
                  return LandmarkCard(
                    landmarkModel: governmentModel.landMarkList[index],
                    governName: governmentModel.name,
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
