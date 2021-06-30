import 'package:MrMart/Models/categories.dart';
import 'package:MrMart/Services/http_services.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final categories = [].obs;
  get featuredCategories => categories
      .where((category) =>
          category.featured == "yes" || category.featured == "true")
      .toList();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    var response = await HTTPServices.fetchCategories();
    List<Category> allCategory = [
      Category(
          cid: "0",
          categoryImage: "",
          categoryName: "All",
          createdOn: DateTime(2021),
          featured: "no",
          id: "0",
          modifiedOn: DateTime(2021))
    ];

    if (response.status) {
      categories.assignAll([...allCategory, ...response.data]);
    }
  }
}
