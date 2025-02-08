import 'dart:developer';
import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/features/auth/data/models/user_model.dart';
import 'package:egy_tour/features/profile/presentation/manager/profile_bloc.dart';
import 'package:egy_tour/features/profile/presentation/manager/profile_events.dart';
import 'package:egy_tour/features/profile/presentation/manager/profile_states.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/custom_clip_path.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/profile_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  final UserModel? user;

  const ProfileScreen({
    super.key,
    required this.user,
  });

  @override
  State<ProfileScreen> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final ValueNotifier<File?> _profileImage = ValueNotifier<File?>(null);

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    log(widget.user?.profileImage?? '');
  }

  void _initializeControllers() {
    if (widget.user != null) {
      _nameController.text = widget.user!.userName!;
      _emailController.text = widget.user!.email;
      _phoneController.text = widget.user!.phoneNumber ?? '';
      _passwordController.text = widget.user!.password;

      if (widget.user!.profileImage != null &&
          widget.user!.profileImage!.isNotEmpty) {
        _profileImage.value = File(widget.user!.profileImage!);
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage.value = File(pickedFile.path);
      log("Selected Image Path: ${pickedFile.path}");
    }
  }

  void _updateProfile(BuildContext context) {
    if (widget.user?.id == null) {
      log("User ID is missing! Cannot update.");
      return;
    }

    FocusScope.of(context).unfocus(); // **Closes keyboard**

    context.read<ProfileBloc>().add(
          UpdateUserEvent(
            id: widget.user!.id!,
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            password: _passwordController.text,
            profileImage: _profileImage.value?.path.isNotEmpty == true ? _profileImage.value!.path : null, // Fix image path issue
          ),
        );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _profileImage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileStates>(
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile Updated Successfully")),
          );
        } else if (state is ProfileUpdateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Update Failed: ${state.errMessage}")),
          );
        }
      },
      child: SingleChildScrollView(
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
                        ValueListenableBuilder<File?>(
                          valueListenable: _profileImage,
                          builder: (context, image, _) {
                            log("Image Path: ${image?.path}");
                            return CircleAvatar(
                              radius: context.screenWidth * 0.15,
                              backgroundImage: image != null && image.existsSync()
                                  ? FileImage(image)
                                  : const AssetImage('assets/images/profile.jpg')
                                      as ImageProvider,
                            );
                          },
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.edit, size: 15, color: Colors.black),
                            ),
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
              onSave: () => _updateProfile(context),
            ),
          ],
        ),
      ),
    );
  }
}
