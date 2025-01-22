import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/common/repository/login_auth/auth_repository_implements.dart';
import 'package:flutter_auth_provider/common/service/auth_api_service.dart';
import 'package:flutter_auth_provider/ui/login/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(
            authRepository: AuthRepositoryImplements(
              authService: AuthApiService(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
