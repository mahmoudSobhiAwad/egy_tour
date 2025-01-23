import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/basic/presentation/manager/basic_cubit.dart';
import 'package:egy_tour/features/basic/presentation/views/basic_view.dart';
import 'package:egy_tour/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckingLoginedUser extends StatelessWidget {
  const CheckingLoginedUser({super.key});

  Future<String> _checkUserLoggedIn() async {
    return await SharedPrefHelper.getString();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _checkUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data != null && snapshot.data != '') {
          return BlocProvider(
            create: (context) => BasicCubit(),
            child: BasicView(
              email: snapshot.data!,
            ),
          );
        } else {
          return const LoginView();
        }
      },
    );
  }
}
