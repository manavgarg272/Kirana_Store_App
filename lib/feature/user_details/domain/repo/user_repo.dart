


import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';

abstract class UserDataRepo{
  Future<void> userDataRepo({required UserModelData userDataModel});
  Future<List<UserModelData>> getUserDataLocationRepo({required String  uuid});
  

}