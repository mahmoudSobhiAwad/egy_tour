import 'package:egy_tour/core/utils/extensions/media_query.dart';
import 'package:egy_tour/core/utils/theme/app_colors.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/custom_clip_path.dart';
import 'package:egy_tour/features/profile/presentation/views/widgets/profile_fields.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: "Ahmed");
  final _emailController = TextEditingController(text: "example.com");
  final _phoneController = TextEditingController(text: "11211888");
  final _passwordController = TextEditingController(text: "12121212");
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
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
            child:
                // Top section with clip-path
                Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: context.screenHeight * 0.3,
                    color: AppColors.blueDark,
                  ),
                ),
                // Profile Image and Edit Icon
                Positioned(
                  top: context.screenHeight * 0.15,
                  left: context.screenWidth * 0.5 - 60,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: context.screenWidth * 0.15,
                        backgroundImage: AssetImage(
                            'assets/images/profile.jpg'), // Replace with your image
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.edit, size: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ProfileFields(
              nameController: _nameController,
              emailController: _emailController,
              phoneController: _phoneController,
              passwordController: _passwordController)
        ],
      ),
    );
  }
}
