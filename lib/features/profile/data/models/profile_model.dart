import 'package:my_practice_bloc/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {

  const ProfileModel({
    required super.id, 
    required super.first_name, 
    required super.last_name, 
    required super.email, 
    required super.avatar
  });
  
  factory ProfileModel.fromJson(Map<String, dynamic> data) {
    return ProfileModel(
      id: data['id'] ?? '', 
      first_name: data['first_name'] ?? '', 
      last_name: data['last_name'] ?? '', 
      email: data['email'] ?? '', 
      avatar: data['avatar'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'avatar': avatar
    };
  }
}