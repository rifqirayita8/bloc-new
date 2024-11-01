part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class HomepageGetProfile extends HomepageEvent {}

class HomepageGetResource extends HomepageEvent {}

class HomepageGetAddress extends HomepageEvent {}

class HomepageGetProfileList extends HomepageEvent {}

class HomepageGetResourceList extends HomepageEvent {}

class FetchNameList extends HomepageEvent {
  final int page;

  const FetchNameList({required this.page});

  @override
  List<Object> get props => [page];
}