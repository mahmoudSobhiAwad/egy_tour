import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/profile/data/repos/profile_repo_imp.dart';
import 'package:egy_tour/features/profile/presentation/manager/profile_bloc.dart';
import 'package:egy_tour/features/profile/presentation/manager/profile_events.dart';
import 'package:egy_tour/features/profile/presentation/manager/profile_states.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/custom_clip_path.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/profile_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel? user;
  final Function(UserModel)? onUserUpdated; // Add callback

  const ProfileScreen({
    super.key,
    required this.user,
    this.onUserUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepoImp()),
      child: BlocConsumer<ProfileBloc, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            onUserUpdated?.call(state.updatedUser);
          }
        },
        builder: (context, state) {
          if (state is ProfileUpdateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ProfileContent(state: state, user: user);
        },
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  final ProfileStates state;
  final UserModel? user;

  const ProfileContent({
    super.key,
    required this.state,
    required this.user,
  });

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    if (widget.user != null) {
      _nameController.text = widget.user!.userName!;
      _emailController.text = widget.user!.email;
      _phoneController.text = widget.user!.phoneNumber ?? '';
      _passwordController.text = widget.user!.password;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.isLandscape
                ? context.screenHeight * 0.5
                : context.screenHeight * 0.33,
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: context.screenHeight * 0.3,
                    color: AppColors.blueDark,
                  ),
                ),
                Positioned(
                  top: context.screenHeight * 0.15,
                  left: context.screenWidth * 0.5 - 60,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: context.screenWidth * 0.15,
                        backgroundImage: const AssetImage('assets/images/profile.jpg'),
                      ),
                      const Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit, size: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ProfileFields(
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            passwordController: _passwordController,
            onSave: () {
              context.read<ProfileBloc>().add(
                    UpdateUserEvent(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      password: _passwordController.text,
                    ),
                  );
            },
          ),
          if (widget.state is ProfileUpdateSuccess)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (widget.state as ProfileUpdateSuccess).message,
                style: const TextStyle(color: Colors.green),
              ),
            )
          else if (widget.state is ProfileUpdateFailure)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (widget.state as ProfileUpdateFailure).errMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
