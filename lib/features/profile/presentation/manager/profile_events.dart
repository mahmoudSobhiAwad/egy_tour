abstract class ProfileEvent {}

class UpdateUserEvent extends ProfileEvent {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? profileImage;

  UpdateUserEvent({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.profileImage,
  });
}
