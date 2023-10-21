import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';

abstract class UserDataDs {
  Future<void> addUserDataDS({required UserModelData userDataModel});
}

class UserDataDsImpl extends UserDataDs {
  @override
  Future<void> addUserDataDS({required UserModelData userDataModel}) async {
    try {
      FirestoreDatabase fb = FirestoreDatabase();
      fb.writeData('UserData', userDataModel.toJson());
      return;
    } catch (e) {
      print("adduserdatads $e");
    }
  }
}
