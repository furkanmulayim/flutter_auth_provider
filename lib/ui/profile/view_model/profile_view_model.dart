import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/common/model/current_auth_model.dart';
import 'package:flutter_auth_provider/common/repository/current_auth/current_auth_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final CurrentAuthRepository currentAuthRepository;

  ProfileViewModel({required this.currentAuthRepository});

  bool _isLoading = false;
  bool _isError = false;
  bool _isSuccess = false;
  CurrentAuthModel? _currentDetail;

  bool get isLoading => _isLoading;

  bool get isError => _isError;

  bool get isSuccess => _isSuccess;

  CurrentAuthModel? get currentDetail => _currentDetail;

  Future<void> getUserData(String accessToken) async {
    _setLoading(true);
    _resetState();
    try {
      _currentDetail = await currentAuthRepository.getCurrentUser(accessToken);
      _isSuccess = true;
      _setLoading(false);
      debugPrint('Detail Success');
      notifyListeners();
    } catch (e) {
      _isError = true;
      _setLoading(false);
      debugPrint('Login error: $e');
      notifyListeners();
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _resetState() {
    _isError = false;
    _isSuccess = false;
    _currentDetail = null;
  }
}
