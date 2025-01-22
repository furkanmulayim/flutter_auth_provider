import 'package:flutter/cupertino.dart';
import '../../../common/entity/user.dart';
import '../../../common/repository/login_auth/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  LoginViewModel({required this.authRepository});

  bool _isLoading = false;
  bool _isError = false;
  bool _isSuccess = false;
  User? _user;

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  bool get isSuccess => _isSuccess;
  User? get user => _user;

  Future<void> login(String username, String password) async {
    _setLoading(true);
    _resetState();

    try {
      _user = await authRepository.login(username, password);
      _isSuccess = true;
      notifyListeners();
    } catch (e) {
      _isError = true;
      debugPrint('Login error: $e');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _resetState() {
    _isError = false;
    _isSuccess = false;
    _user = null;
  }
}