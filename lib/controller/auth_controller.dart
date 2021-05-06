import 'package:get/get.dart';
import 'package:presensi/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  Login(String _email, String _password) {
    try {
      final login = authRepository.loginUser(_email, _password);
      // authRepository.(login.data.token);
    } catch (e) {
      print(e);
    }
  }
}
