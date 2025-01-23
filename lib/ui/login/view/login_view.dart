import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/core/routes/app_router.dart';
import 'package:flutter_auth_provider/ui/login/view_model/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part '../widget/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, _) {
            // LOADING STATE
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // SUCCESS STATE
            if (viewModel.isSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _goToProfile(context, viewModel.user!.accessToken);
              });
            }

            // ERROR STATE
            if (viewModel.isError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _showSnackBar(context, 'Giriş Basarılı olmadı. ');
              });
            }

            // Default (Login Form)
            return _LoginPageView();
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _goToProfile(BuildContext context, String accessToken) {
    context.goNamed(RoutesPath.profilePath.name, extra: accessToken);
  }
}
