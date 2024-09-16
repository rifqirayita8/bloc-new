import 'package:dartz/dartz.dart';
import 'package:my_practice_bloc/core/error/failure.dart';
import 'package:my_practice_bloc/features/auth/domain/repositories/auth_repository.dart';

class UserLogin {
  final AuthRepository authRepository;

  const UserLogin({required this.authRepository});

  Future<Either<Failure, String>> execute(String email, String password) async {
    return await authRepository.authLogin(email, password);
  }
}