import 'package:egy_tour/core/utils/functions/firestore_services.dart';
import 'package:egy_tour/features/basic/presentation/views/basic_view.dart';
import 'package:egy_tour/features/auth/presentation/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // final String value = await SharedPrefHelper.getString();
    if (FirebaseAuth.instance.currentUser != null) {
      _initialView = BasicView(
          user: await FirestoreServices.getUser(
              FirebaseAuth.instance.currentUser!.uid));
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
