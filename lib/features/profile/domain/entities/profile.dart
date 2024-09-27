import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String avatar;

  const Profile({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.avatar,
  });
  
  @override
  List<Object?> get props => [
    id,
    first_name,
    last_name,
    email,
    avatar,
  ];
}