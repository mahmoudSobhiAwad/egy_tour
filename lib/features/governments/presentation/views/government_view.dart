import 'package:egy_tour/core/utils/constants/governments_list.dart';
import 'package:egy_tour/features/governments/presentation/views/widgets/government_card.dart';
import 'package:flutter/material.dart';

class GovernmentView extends StatefulWidget {
  const GovernmentView({super.key});

  @override
  State<GovernmentView> createState() => _GovernmentViewState();
}

class _GovernmentViewState extends State<GovernmentView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: governmentsList.length,
      itemBuilder: (context, index) {
        return GovernmentCard(
          governModel: governmentsList[index],
        );
      },
    );
  }
}
