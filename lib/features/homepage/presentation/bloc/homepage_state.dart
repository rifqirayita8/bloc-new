part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();  

  @override
  List<Object> get props => [];
}
class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class GetProfileSuccess extends HomepageState {
  final String profile;
  const GetProfileSuccess({required this.profile});

  @override
  List<Object> get props => [profile];
}

class GetResourceSuccess extends HomepageState {
  final String resource;
  const GetResourceSuccess({required this.resource});

  @override
  List<Object> get props => [resource];
}

class HomepageLoaded extends HomepageState {
  final String profile;
  final String resource;
  const HomepageLoaded({required this.profile, required this.resource});

  @override
  List<Object> get props => [profile, resource];
}

class HomepageFailure extends HomepageState {
  final String message;
  const HomepageFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class HomepageSuccess extends HomepageState {
  final String profile;
  final String resource;

  const HomepageSuccess({required this.profile, required this.resource});

  @override
  List<Object> get props => [profile, resource];
}