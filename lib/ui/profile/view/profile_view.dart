import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final String accessToken;

  const ProfileView({super.key, required this.accessToken});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(); //PersonalInfo(user: currentUser);
  }
}

class WidgetForFailedState extends StatelessWidget {
  const WidgetForFailedState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('FAİLED STATE'));
  }
}

class WidgetForLoadingState extends StatelessWidget {
  const WidgetForLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
