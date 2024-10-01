import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_practice_bloc/features/homepage/domain/usecases/get_profile.dart';
import 'package:my_practice_bloc/features/homepage/domain/usecases/get_resource.dart';
import 'package:my_practice_bloc/features/homepage/presentation/bloc/model_coba.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final GetProfile getProfile;
  final GetResource getResource;
  
  HomepageBloc(
    this.getProfile, 
    this.getResource
  ) : super(HomepageInitial()) {
    on<HomepageGetProfile>(_onGetProfile);
    on<HomepageGetResource>(_onGetResource);
    on<HomepageGetAddress>(_onGetAddress);
  }
    Future<void> _onGetProfile(
      HomepageGetProfile event,
      Emitter<HomepageState> emit,
      ) async {
        final res= await getProfile.execute();
        res.fold(
          (failure) => emit(HomepageFailure(message: failure.message)), 
          (profile) {
            if (state is HomepageLoaded) {
              final currentState= state as HomepageLoaded;
              emit(HomepageLoaded(user: profile, resource: currentState.resource, address: currentState.address));
            } else {
              emit(HomepageLoaded(user: profile, resource: '', address: ''));
            }
          }
        );
      }

      Future<void> _onGetResource(
        HomepageGetResource event,
        Emitter<HomepageState> emit,
      ) async {
        final res= await getResource.execute();
        res.fold(
          (failure) => emit(HomepageFailure(message: failure.message)),
          (resource) {
            if (state is HomepageLoaded) {
              final currentState= state as HomepageLoaded;
              emit(HomepageLoaded(user: currentState.user, resource: resource, address: currentState.address));
            } else {
              emit(HomepageLoaded(user: '', resource: resource, address: ''));
            }
          }
        );
      }

      Future<void> _onGetAddress(
        HomepageGetAddress event,
        Emitter<HomepageState> emit,
      ) async {
        try {
          const res= 'Ponorogo';
          if (state is HomepageLoaded) {
            final currentState= state as HomepageLoaded;
            emit(HomepageLoaded(user: currentState.user, resource: currentState.resource, address: res));
          } else {
            emit(const HomepageLoaded(user: '', resource: '', address: res));
          }
        } catch(e) {
          emit(const HomepageFailure(message: 'Failed to load data'));
        }
      }
    
  }
