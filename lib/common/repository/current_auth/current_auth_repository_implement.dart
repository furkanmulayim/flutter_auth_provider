import '../../model/current_auth_model.dart';
import '../../service/current_auth_api_service.dart';
import 'current_auth_repository.dart';

class CurrentAuthRepositoryImplements extends CurrentAuthRepository {
  final CurrenrAuthApiService currentAuthService;

  CurrentAuthRepositoryImplements({required this.currentAuthService});

  @override
  Future<CurrentAuthModel> getCurrentUser(String accessToken) async {
    return await currentAuthService.fetchUserData(accessToken);
  }
}
