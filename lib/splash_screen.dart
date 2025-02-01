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
    //checks if the user is logged in using firebase authentication if a user is logged in navigates to the home screen
    // if not navigates to the login screen
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
