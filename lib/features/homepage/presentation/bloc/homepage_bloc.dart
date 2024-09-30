import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_practice_bloc/features/homepage/domain/usecases/get_profile.dart';
import 'package:my_practice_bloc/features/homepage/domain/usecases/get_resource.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final GetProfile getProfile;
  final GetResource getResource;

  String? profile;
  String? resource;
  
  HomepageBloc(this.getProfile, this.getResource) : super(HomepageInitial()) {
    on<HomepageGetProfile>((event, emit) async {
      final res= await getProfile.execute();
      res.fold(
        (failure) => emit(HomepageFailure(message: failure.message)),
        (data) {
          if (state is GetResourceSuccess) {
            emit(HomepageSuccess(profile: data, resource: (state as GetResourceSuccess).resource));
          } else {
            profile= data;
            emit(GetProfileSuccess(profile: data));
          }
        }
      );
    });

    on<HomepageGetResource>((event, emit) async {
      final res= await getResource.execute();
      res.fold(
        (failure) => emit(HomepageFailure(message: failure.message)), 
        (data) {
          if (state is GetProfileSuccess) {
            emit(HomepageSuccess(profile: (state as GetProfileSuccess).profile, resource: data));
          } else {
            resource= data;
            emit(GetResourceSuccess(resource: data));
          }
        }
      );
    });
  }
}
