import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_practice_bloc/features/profile/domain/entities/profile.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/get_user.dart';
import 'package:my_practice_bloc/features/profile/domain/usecases/profile_params.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUser getUser;
  ProfileBloc(this.getUser) : super(ProfileInitial()) {
    on<ProfileEvent>((_, emit) {
      emit(ProfileLoading());
    });

    on<GetProfile>((event, emit) async {
      emit(ProfileLoading());
      final res= await getUser.execute(event.params);
      res.fold(
        (failure) => emit(ProfileFailure(message: failure.message)),
        (profileRes) => emit(ProfileSuccess(profile: profileRes))
      );
    });

    on<ResetProfile>((_, emit) {
      emit(ProfileInitial());
    });
  }
}
