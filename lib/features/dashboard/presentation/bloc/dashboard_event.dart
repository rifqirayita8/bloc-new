part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class AuthGetProfile extends DashboardEvent {
  final DashboardParams params;

  const AuthGetProfile({required this.params});
}

class ResetProfile extends DashboardEvent {
  const ResetProfile();
}

class AuthGetPaint extends DashboardEvent {
  final DashboardParams params;

  const AuthGetPaint({required this.params});
}

class ResetPaint extends DashboardEvent {
  const ResetPaint();
}

