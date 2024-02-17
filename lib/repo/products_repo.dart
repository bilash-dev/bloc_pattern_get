import 'package:bloc_get_data/models/products_model.dart';
import 'package:http/http.dart' as http;
class ProductsRepo{
  Future<List<ProductsModel>> getProducts() async{
    final String url = 'https://jsonplaceholder.typicode.com/posts';

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return productsModelFromJson(response.body);
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
}