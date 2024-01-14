

import 'package:kirna_store_app/core/services/firebase_service/firebase_service.dart';
import 'package:kirna_store_app/feature/banner_details/data/model/banner_model.dart';

abstract class BannerDs{
  Future<List<BannerModel>> getProductBannerListDs();
}



class BannerDsImpl extends BannerDs {

  @override
  Future<List<BannerModel>> getProductBannerListDs() async {
    try{
      FirestoreDatabase fb =  FirestoreDatabase();      

    }
    catch(e){
      print("bannerds $e");
    }
    return [];
  }


}