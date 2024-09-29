part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();  

  @override
  List<Object> get props => [];
}
class ProfileInitial extends DashboardState {}

class ProfileLoading extends DashboardState {}

class ProfileSuccess extends DashboardState {
  final Profile profile;

  const ProfileSuccess({required this.profile});

  @override
  List<Object> get props => [profile];
}

class ProfileFailure extends DashboardState {
  final String message;

  const ProfileFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class PaintInitial extends DashboardState {}

class PaintLoading extends DashboardState {}

class PaintSuccess extends DashboardState {
  final Paint paint;

  const PaintSuccess({required this.paint});

  @override
  List<Object> get props => [paint];
}

class PaintFailure extends DashboardState {
  final String message;

  const PaintFailure({required this.message});

  @override
  List<Object> get props => [message];
}