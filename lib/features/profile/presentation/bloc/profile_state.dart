part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();  

  @override
  List<Object> get props => [];
}
class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final Profile profile;

  const ProfileSuccess({required this.profile});

  @override
  List<Object> get props => [profile];
}

class ProfileFailure extends ProfileState {
  final String message;

  const ProfileFailure({required this.message});

  @override
  List<Object> get props => [message];
}