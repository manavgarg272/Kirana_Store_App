

import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';
import 'package:kirna_store_app/feature/user_details/domain/repo/user_repo.dart';



class GetLocationUseCase extends UseCase<List<UserModelData>, String >{

  final UserDataRepo getUserDataRepo;
  GetLocationUseCase({
    required this.getUserDataRepo
  });

  @override
  Future<List<UserModelData>> call(String params) {
  return getUserDataRepo.getUserDataLocationRepo(uuid: params);
  }


}