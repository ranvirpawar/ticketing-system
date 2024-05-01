import 'package:get/get.dart';
import '../models/login_model.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  final ApiService authService;

  LoginController({required this.authService});

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> login(String email, String password) async {
    _isLoading.value = true;

    final loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    print('z🤷‍♂️' + loginRequest.toString());

    try {
      final loginResponse = await authService.login(loginRequest);
      print('🔛🔛' + loginResponse.toString());

      Get.offNamed('/homescreen', arguments: loginResponse);
    } catch (e) {
      print(e);
      Get.snackbar('Login Failed', e.toString(),
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING);
    } finally {
      _isLoading.value = false;
    }
  }
}
