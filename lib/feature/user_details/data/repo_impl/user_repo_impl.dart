import 'package:kirna_store_app/feature/user_details/data/ds/user_ds.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';
import 'package:kirna_store_app/feature/user_details/domain/repo/user_repo.dart';

class UserDataRepoImpl extends UserDataRepo {
  UserDataDs userDataDs;
  UserDataRepoImpl({required this.userDataDs});
  @override
  Future<void> userDataRepo({required UserModelData userDataModel}) {
    return userDataDs.addUserDataDS(userDataModel: userDataModel);
  }
}
