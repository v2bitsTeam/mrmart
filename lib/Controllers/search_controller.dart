import 'package:mr_mart/Models/products.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchResults = [].obs;

  void updateSearchResults(Product product) {
    searchResults.add(product);
  }

  void resetSearchResults() {
    searchResults.clear();
  }
}
