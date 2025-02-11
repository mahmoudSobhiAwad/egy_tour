import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_event.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_state.dart';
import 'package:egy_tour/features/governments/presentation/views/widgets/government_card.dart';
import 'package:egy_tour/features/governments/presentation/manager/bloc/places/places_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GovernmentView extends StatefulWidget {
  const GovernmentView({super.key});

  @override
  State<GovernmentView> createState() => _GovernmentViewState();
}

class _GovernmentViewState extends State<GovernmentView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesBloc()..add(LoadPlaces()),
      child: BlocBuilder<PlacesBloc, PlacesState>(
        builder: (context, state) {
          final placesBloc = BlocProvider.of<PlacesBloc>(context);

          if (state is PlacesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlacesLoaded) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: state.governments.length,
                    itemBuilder: (context, index) {
                      return GovernmentCard(
                        governModel: state.governments[index], placesBloc: placesBloc,
                      );
                    },
                  ),
                ),
              
              ],
            );
          }  else if (state is PlacesError) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: Text("Please Wait .."),
          );
        },
      ),
    );
  }
}
