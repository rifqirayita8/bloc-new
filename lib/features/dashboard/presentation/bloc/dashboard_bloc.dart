import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/paint.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_paint.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/dashboard_params.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUser getUser;
  final GetPaint getPaint;

  DashboardBloc(
    this.getUser, 
    this.getPaint
  ) : super(ProfileInitial()) {
    on<DashboardEvent>((_, emit) {});

    on<AuthGetProfile>((event, emit) async {
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

    on<AuthGetPaint>((event, emit) async {
      emit(PaintLoading());
      final res= await getPaint.execute(event.params);
      res.fold(
        (failure) => emit(PaintFailure(message: failure.message)),
        (paintRes) => emit(PaintSuccess(paint: paintRes)),
      );
    });
  }
}
