import 'package:my_practice_bloc/features/auth/domain/repositories/auth_repository.dart';

class UserSetUrl {
  final AuthRepository authRepository;

  UserSetUrl({required this.authRepository});

  Future<void> execute(String url) async {
    return await authRepository.authSetUrl(url);
  }
}