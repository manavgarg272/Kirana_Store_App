import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';
import 'package:kirna_store_app/feature/user_details/domain/repo/user_repo.dart';

class UserDataUseCase extends UseCase<void, UserModelData> {
  final UserDataRepo userDataRepo;
  UserDataUseCase({required this.userDataRepo});

  @override
  Future<void> call(UserModelData params) {
    return userDataRepo.userDataRepo(userDataModel: params);
  }
}
