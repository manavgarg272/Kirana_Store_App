
import 'package:kirna_store_app/feature/banner_details/data/model/banner_model.dart';

abstract class BannerRepo{

  Future<List<BannerModel>> getProductBannerList();
}