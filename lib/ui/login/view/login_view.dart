import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/common/repository/login_auth/auth_repository_implements.dart';
import 'package:flutter_auth_provider/common/service/auth_api_service.dart';
import 'package:flutter_auth_provider/ui/login/view_model/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_router.dart';

part '../widget/login_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    super.initState();
    loginViewModel = LoginViewModel(
        authRepository:
            AuthRepositoryImplements(authService: AuthApiService()));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => loginViewModel,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Builder(
            builder: (context) {
              final viewModel = Provider.of<LoginViewModel>(context,listen: true);
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // State error
              if (viewModel.isError) {
                return const Center(
                    child: Text('Login failed! Please try again.'));
              }

              // State success
              if (viewModel.isSuccess) {
                 _goToProfile(context, viewModel.user!.accessToken);
              }

              // Initial state (Login form)
              return _LoginPageView();
            },
          )),
    );
  }

  // SnackBar gösterme fonksiyonu
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Profil sayfasına yönlendirme fonksiyonu
  void _goToProfile(BuildContext context, String accessToken) {
    context.goNamed(RoutesPath.profilePath.name, extra: accessToken);
  }
}
