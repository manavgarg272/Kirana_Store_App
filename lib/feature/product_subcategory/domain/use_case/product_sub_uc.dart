import 'package:kirna_store_app/core/usecase/usecases.dart';
import 'package:kirna_store_app/feature/product_subcategory/data/model/sub_category_model.dart';
import 'package:kirna_store_app/feature/product_subcategory/domain/repo/sub_category_repo.dart';

class SubCategoryUseCase extends UseCase<List<SubCategoryModel>, String> {
 final  SubCategoryRepo subCategoryRepo;

  SubCategoryUseCase({required this.subCategoryRepo});
  @override
  Future<List<SubCategoryModel>> call(String params) async {
    return subCategoryRepo.subCategoryRepo(categoryData: params);
  }
}
