import 'package:flutter/material.dart';

class ProfileViewModel extends StatefulWidget {
  const ProfileViewModel({super.key});

  @override
  State<ProfileViewModel> createState() => _ProfileViewModelState();
}

class _ProfileViewModelState extends State<ProfileViewModel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(),
    );
  }
}
