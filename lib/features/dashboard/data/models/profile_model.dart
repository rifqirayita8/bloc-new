import 'package:my_practice_bloc/features/dashboard/domain/entities/profile.dart';

class ProfileModel extends Profile {
  final String firstName;
  final String lastName;

  const ProfileModel({
    required super.id, 
    required this.firstName,
    required this.lastName,
    required super.email, 
    required super.avatar
  }) : super(
    fullName: "$firstName $lastName",
  ) ;
  
  factory ProfileModel.fromJson(Map<String, dynamic> data) {
    return ProfileModel(
      id: data['id'] ?? '', 
      firstName: data['first_name'] ?? '', 
      lastName: data['last_name'] ?? '', 
      email: data['email'] ?? '', 
      avatar: data['avatar'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'avatar': avatar
    };
  }
}