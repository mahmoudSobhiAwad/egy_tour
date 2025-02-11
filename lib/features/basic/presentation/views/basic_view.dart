import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:egy_tour/core/utils/extensions/navigation.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/core/utils/theme/font_styles.dart';
import 'package:egy_tour/core/utils/widget/custom_snack_bar.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/auth/presentation/views/login_view.dart';
import 'package:egy_tour/features/basic/presentation/manager/basic_cubit.dart';
import 'package:egy_tour/features/basic/presentation/manager/user_cubit.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_basic_drawer.dart';
import 'package:egy_tour/features/basic/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:egy_tour/features/favourites/presentation/views/favourites_view.dart';
import 'package:egy_tour/features/governments/presentation/views/government_view.dart';
import 'package:egy_tour/features/home/presentation/views/home_view.dart';
import 'package:egy_tour/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicView extends StatelessWidget {
  const BasicView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BasicCubit()),
        BlocProvider(create: (context) => UserCubit()..fetchUserData()),
      ],
      child: BasicViewContent(),
    );
  }
}

class BasicViewContent extends StatelessWidget {
  const BasicViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasicCubit, BasicState>(
      listener: (context, state) {
        if (state is SuccessLogoutState) {
          context.pushReplacement(LoginView());
        } else if (state is FailureLogoutState) {
          showCustomSnackBar(context, state.errMessage ?? "",
              backgroundColor: AppColors.red);
        }
      },
      buildWhen: (prev, curr) => curr is BaiscChangeBasicIndex,
      builder: (context, state) {
        int selectedIndex = 0;
        if (state is BaiscChangeBasicIndex) {
          selectedIndex = state.index;
        }
          // Refetch user data when returning to HomeView
        if (selectedIndex == 0) {
          context.read<UserCubit>().fetchUserData();
        }

        return BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            if (userState is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (userState is UserError) {
              return Center(child: Text(userState.message));
            } else if (userState is UserLoaded) {
              UserModel user = userState.user;
              log("User Profile Image: ${user.profileImage}");
              return Scaffold(
                backgroundColor: AppColors.white,
                drawer: selectedIndex == 3
                    ? null
                    : CustomBasicDrawer(
                        userName: user.userName ?? "",
                        profileImage: user.profileImage,
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
                      Expanded(child: HomeView(user: user)),
                      const Expanded(child: GovernmentView()),
                      Expanded(child: FavouritesView(user: user)),
                      Expanded(child: ProfileScreen(user: user)),
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
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
