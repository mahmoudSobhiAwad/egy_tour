import 'package:egy_tour/core/utils/functions/shared_pref_helper.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/auth/data/repo/auth_repo_imp.dart';
import 'package:egy_tour/features/basic/presentation/views/basic_view.dart';
import 'package:egy_tour/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class CheckingLoginedUser extends StatefulWidget {
  const CheckingLoginedUser({super.key});

  @override
  State<CheckingLoginedUser> createState() => _SplashCheckingState();
}

class _SplashCheckingState extends State<CheckingLoginedUser> {
  Widget? _initialView;

  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }

  Future<void> _checkUserLoggedIn() async {
    final String value = await SharedPrefHelper.getString();
    if (value.isNotEmpty) {
      _initialView =
          BasicView(user: UserModel(email: "mahmoud@gmail.com", password: "123456",phoneNumber: '000000',userName: "Mahmoud"));
    } else {
      _initialView = LoginView();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_initialView == null) {
      return const Scaffold();
    }

    return _initialView!;
  }
}
