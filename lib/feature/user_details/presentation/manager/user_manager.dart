import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kirna_store_app/feature/user_details/data/ds/user_ds.dart';
import 'package:kirna_store_app/feature/user_details/data/model/user_model.dart';
import 'package:kirna_store_app/feature/user_details/data/repo_impl/user_repo_impl.dart';
import 'package:kirna_store_app/feature/user_details/domain/use_case/user_uc.dart';

enum LocationManagerNotiferState {error, loading ,loaded , initial}
enum GetLocationStateNoitiferState{error, loading , loaded, inital}
class LocationManagerNotifer extends ChangeNotifier {
  String _currentAddress = "";
  String get currentAddress => _currentAddress;
  set currentAddress(String value) {
    _currentAddress = value;
    notifyListeners();
  }

  late Placemark _place;
  Placemark get place => _place;
  set place(Placemark value) {
    _place = value;
    notifyListeners();
  }

  late Position _currentPosition;
  Position get currentPosition => _currentPosition;
  set currentPosition(Position value) {
    _currentPosition = value;
    notifyListeners();
  }

  late bool _serviceEnabled;
  bool get serviceEnabled => _serviceEnabled;
  set serviceEnabled(bool value) {
    _serviceEnabled = value;
    notifyListeners();
  }

  late LocationPermission _permission;
  LocationPermission get permission => _permission;
  set permission(LocationPermission value) {
    _permission = value;
    notifyListeners();
  }
  LocationManagerNotiferState _locationNotiferState=LocationManagerNotiferState.initial;
  LocationManagerNotiferState get locationNotiferState=>_locationNotiferState;
  set locationNotiferState(LocationManagerNotiferState value) {
    _locationNotiferState=value;
    notifyListeners();
  }

  GetLocationStateNoitiferState _getLocationNotifier = GetLocationStateNoitiferState.inital;
  GetLocationStateNoitiferState get getLocationNotifier => _getLocationNotifier;
  set getLocationNotifier(GetLocationStateNoitiferState value) {
     _getLocationNotifier = value;
     notifyListeners();
  }


  Future<bool> _handleLocationPermission(BuildContext context) async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    getLocationNotifier = GetLocationStateNoitiferState.loading;
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      _getAddressFromLatLng(_currentPosition);
      getLocationNotifier = GetLocationStateNoitiferState.loaded;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition.latitude, _currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      place = placemarks[0];
      currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  final UserDataUseCase _userDataUseCase = UserDataUseCase(
      userDataRepo: UserDataRepoImpl(userDataDs: UserDataDsImpl()));

  Future<void> saveUserAddressToFirebase({required UserModelData userData}) async {
    try {
      locationNotiferState = LocationManagerNotiferState.loading;
       await _userDataUseCase(userData);
      locationNotiferState = LocationManagerNotiferState.loaded;
    } catch (e) {
      print("saveuseraddresstofirebase $e");
    }
  }

}
