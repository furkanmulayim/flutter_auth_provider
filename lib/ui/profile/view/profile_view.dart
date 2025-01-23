import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/common/model/current_auth_model.dart';
import 'package:flutter_auth_provider/ui/profile/view_model/profile_view_model.dart';
import 'package:flutter_auth_provider/ui/profile/widget/personal_info.dart';
import 'package:provider/provider.dart';

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
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileViewModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      profileViewModel.getUserData(widget.accessToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          title: const Text('Profile'),
        ),
        body: const WidgetForSuccessState());
  }
}

class WidgetForSuccessState extends StatelessWidget {
  const WidgetForSuccessState({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading) {
          return const WidgetForLoadingState();
        }
        if (viewModel.isError) {
          return const WidgetForFailedState();
        }
        if (viewModel.isSuccess) {
          return PersonalInfo(user: viewModel.currentDetail!);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

void forFailedState(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

void dene(CurrentAuthModel detail) {}

class WidgetForFailedState extends StatelessWidget {
  const WidgetForFailedState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HATA'),
    );
  }
}

class WidgetForLoadingState extends StatelessWidget {
  const WidgetForLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
