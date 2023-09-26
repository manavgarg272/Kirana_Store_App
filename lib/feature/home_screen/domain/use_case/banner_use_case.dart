import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/home_screen/data/model/banner_model.dart';
import 'package:kirna_store_app/feature/home_screen/domain/repo/product_repo.dart';

class BannerListUseCase extends UseCaseForNoParams<List<BannerModel>> {
  final ProductRepo productRepo;
  BannerListUseCase({required this.productRepo});

  @override
  Future<List<BannerModel>> call() async {
    return await productRepo.getProductBannerList();
  }
}
