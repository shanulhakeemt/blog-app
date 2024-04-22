import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class SignUpUseCase implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(params) async {

    return await authRepository.signUpWithEmailAndPassword(
        email: params.email, password: params.password, name: params.name);
    
  
  
  
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams(
      {required this.name, required this.email, required this.password});
}
