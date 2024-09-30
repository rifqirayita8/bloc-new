part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class HomepageGetProfile extends HomepageEvent {}

class HomepageGetResource extends HomepageEvent {}