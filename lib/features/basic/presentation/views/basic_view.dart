import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/features/basic/presentation/manager/basic_cubit.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_basic_drawer.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/show_dialog_exist.dart';
import 'package:egy_tour/features/governments/presentation/views/government_view.dart';
import 'package:egy_tour/features/home/presentation/views/home_view.dart';
import 'package:egy_tour/features/profile/presentation/views/profile_view.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/favourites/presentation/views/favourites_view.dart';

class BasicView extends StatefulWidget {
  const BasicView({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  int selectedIndex = 0;
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
      child: BlocBuilder<BasicCubit, BasicState>(
        buildWhen: (prev, curr) {
          return curr is BaiscChangeBasicIndex;
        },
        builder: (context, state) {
          if (state is BaiscChangeBasicIndex) {
            selectedIndex = state.index;
          }
          return Scaffold(
            backgroundColor: AppColors.white,
            drawer: selectedIndex == 3
                ? null
                : CustomBasicDrawer(
                    userName: widget.user.userName ?? "",
                    logout: (bool value) async {
                      if (value) {
                        // await homeRepoImp.logOut().then((value) {
                        //   if (context.mounted) {
                        //     context.pushReplacement(LoginView());
                        //   }
                        // });
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
                      user: widget.user,
                    ),
                  ),
                  const Expanded(
                    child: GovernmentView(),
                  ),
                  Expanded(
                    child: FavouritesView(
                      user: widget.user,
                    ),
                  ),
                  Expanded(
                    child: ProfileScreen(
                      user: widget.user,
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
