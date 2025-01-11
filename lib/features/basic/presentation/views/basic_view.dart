import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_basic_drawer.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/show_dialog_exist.dart';
import 'package:egy_tour/features/governments/presentation/views/government_view.dart';
import 'package:egy_tour/features/home/data/repos/home_repo_imp.dart';
import 'package:egy_tour/features/home/presentation/views/home_view.dart';
import 'package:egy_tour/features/login/presentation/views/login_view.dart';
import 'package:egy_tour/features/profile/presentation/views/profile_view.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../favourites/presentation/views/favourites_view.dart';

class BasicView extends StatefulWidget {
  const BasicView({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  int selectedIndex = 0;
  bool isLoading = true;
  final HomeRepoImp homeRepoImp = HomeRepoImp();
  User? userModel;

  @override
  void initState() {
    getUserModel();
    super.initState();
  }

  Future<void> getUserModel() async {
    final result = await homeRepoImp.getUserModel(widget.email);
    result.fold((user) {
      userModel = user;
      isLoading = false;
    }, (error) {
      isLoading = false;
    });
    setState(() {});
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
      child: Scaffold(
        backgroundColor: AppColors.white,
        drawer: selectedIndex == 3
            ? null
            : CustomBasicDrawer(
                userName: userModel?.userName ?? "",
                logout: (bool value) async {
                  if (value) {
                    await homeRepoImp.logOut().then((value) {
                      if (context.mounted) {
                        context.pushReplacement(LoginView());
                      }
                    });
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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  [
                    Expanded(
                      child: HomeView(
                        user: userModel,
                      ),
                    ),
                    const Expanded(
                      child: GovernmentView(),
                    ),
                    Expanded(
                      child: FavouritesView(
                        user: userModel,
                      ),
                    ),
                    const Expanded(
                      child: ProfileScreen(),
                    ),
                  ][selectedIndex],
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomBottomNavigationBar(
                      changeScreen: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      selectedIndex: selectedIndex,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
