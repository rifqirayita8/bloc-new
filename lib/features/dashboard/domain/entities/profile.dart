import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String avatar;

  const Profile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatar,
  });
  
  @override
  List<Object?> get props => [
    id,
    fullName,
    email,
    avatar,
  ];
}