import 'package:equatable/equatable.dart';

class HomePageData extends Equatable {
  final String? profile;
  final String? resource;

  const HomePageData({
    this.profile, 
    this.resource
  });

  HomePageData copyWith({
    String? profile,
    String? resource
  }) {
    return HomePageData(
      profile: profile ?? this.profile,
      resource: resource ?? this.resource
    );
  }
  
  @override
  List<Object?> get props => [
    profile,
    resource
  ];
}