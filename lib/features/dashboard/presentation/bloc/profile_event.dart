part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {
  final GetUserParams params;

  const GetProfile({required this.params});
}

class ResetProfile extends ProfileEvent {
  const ResetProfile();
}