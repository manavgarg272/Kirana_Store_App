import 'package:flutter/foundation.dart';
import 'package:kirna_store_app/feature/user_details/data/ds/user_ds.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';
import 'package:kirna_store_app/feature/user_details/data/repo_impl/user_repo_impl.dart';
import 'package:kirna_store_app/feature/user_details/domain/use_case/location_uc.dart';

enum GetUserLocationNotifierState { loading, laoded, error, initial }

class GetUserLocationNotifier extends ChangeNotifier {
  GetUserLocationNotifierState _getUserLocationNotifierState =
      GetUserLocationNotifierState.initial;
  GetUserLocationNotifierState get getUserLocationNotifierState =>
      _getUserLocationNotifierState;
  set getUserLocationNotifierState(GetUserLocationNotifierState value) {
    _getUserLocationNotifierState = value;
    notifyListeners();
  }

  final GetLocationUseCase _getLocationUseCase = GetLocationUseCase(
      getUserDataRepo: UserDataRepoImpl(userDataDs: UserDataDsImpl()));

  List<UserModelData> _userAddress = [];
  List<UserModelData> get userAddress => _userAddress;
  set userAddress(List<UserModelData> value) {
    _userAddress = value;
    notifyListeners();
  }

  Future<void> getUserLocationAddress({required String uuid}) async {
    try {
      getUserLocationNotifierState = GetUserLocationNotifierState.loading;
      userAddress = await _getLocationUseCase(uuid);
      getUserLocationNotifierState = GetUserLocationNotifierState.laoded;
    } catch (e) {
      print("getuserlocationaddress $e");
    }
  }
}
