import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:egy_tour/features/auth/presentation/views/login_view.dart';
import 'package:egy_tour/features/basic/presentation/manager/basic_cubit.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_basic_drawer.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/show_dialog_exist.dart';
import 'package:egy_tour/features/governments/presentation/views/government_view.dart';
import 'package:egy_tour/features/home/presentation/views/home_view.dart';
import 'package:egy_tour/features/profile/presentation/views/profile_view.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/favourites/presentation/views/favourites_view.dart';

class BasicView extends StatefulWidget {
  const BasicView({
    super.key,
  });


  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  int selectedIndex = 0;
  UserModel? _user;
  bool _isLoading = true;

   @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        _user = UserModel.fromJson(
            userDoc as DocumentSnapshot<Map<String, dynamic>>, null);
      }
    } catch (e) {
      showCustomSnackBar(context, "Failed to load user data: $e",
          backgroundColor: AppColors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        bool checkAfter = false;
        checkAfter = await showDialogToStayOrExit(context) ?? false;

        if (checkAfter && context.mounted) {
          SystemNavigator.pop();
        }
      },
      child: BlocConsumer<BasicCubit, BasicState>(
        listener: (context, state) {
          if (state is SuccessLogoutState) {
            context.pushReplacement(LoginView());
          } else if (state is FailureLogoutState) {
            showCustomSnackBar(context, state.errMessage ?? "",
                backgroundColor: AppColors.red);
          }
        },
        buildWhen: (prev, curr) {
          return curr is BaiscChangeBasicIndex;
        },
        builder: (context, state) {
          if (state is BaiscChangeBasicIndex) {
            selectedIndex = state.index;
          }
           if (_isLoading) {
            return const Center(child: CircularProgressIndicator());
          } 
          return Scaffold(
            backgroundColor: AppColors.white,
            drawer: selectedIndex == 3
                ? null
                : CustomBasicDrawer(
                    userName: _user?.userName ?? "",
                    logout: (bool value) async {
                      if (value) {
                        context.read<BasicCubit>().logOut();
                      }
                    },
                  ),
            appBar: selectedIndex == 3
                ? null
                : AppBar(
                    backgroundColor: AppColors.white,
                    title: Text(
                      "home.app_name".tr(),
                      style: AppTextStyles.bold36,
                    ),
                  ),
            body: Column(
              children: [
                [
                  Expanded(
                    child: HomeView(
                      user: _user!,
                    ),
                  ),
                  const Expanded(
                    child: GovernmentView(),
                  ),
                  Expanded(
                    child: FavouritesView(
                      user: _user!,
                    ),
                  ),
                  Expanded(
                    child: ProfileScreen(
                      user: _user!,
                    ),
                  ),
                ][selectedIndex],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomBottomNavigationBar(
                    changeScreen: (index) {
                      context.read<BasicCubit>().changeScreen(index);
                    },
                    selectedIndex: selectedIndex,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
