import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';

abstract class UserDataDs {
   Future<void> addUserDataDS({required UserModelData userDataModel});
   Future<List< UserModelData>> getUserDataLocationDs({required String uuid});
}

class UserDataDsImpl extends UserDataDs {
  @override
  Future<void> addUserDataDS({required UserModelData userDataModel}) async {
    try {
      FirestoreDatabase fb = FirestoreDatabase();
      fb.writeData('UserDataLocation', userDataModel.toJson());
      return;
    } catch (e) {
      print("adduserdatads $e");
    }
  }
  
  @override
  Future<List<UserModelData>> getUserDataLocationDs({required String uuid}) async  {
    List<UserModelData> addressList = [];
    try {
      FirestoreDatabase fb = FirestoreDatabase();
      QuerySnapshot ? querySnapshot = await fb.readDataFromCollectionWithFilterEqual('UserDataLocation', 'userId', uuid);
      for (var doc in querySnapshot!.docs) {
        var docsData = doc.data()as Map<String, dynamic>;
        addressList.add(UserModelData.fromJson(docsData));
      } 
    } catch (e) {
      print("usermodeldata $e");
    }

    return addressList;
  }
}
