import 'package:bloc_get_data/bloc/products_event.dart';
import 'package:bloc_get_data/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/products_model.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState>{
  ProductsBloc() : super(ProductsLoadingState()){
    on<ProductsLoadedEvent>((event, emit) async{
      try{
        emit(ProductsLoadingState());
        final url  = 'https://jsonplaceholder.typicode.com/posts';
        var response = await http.get(Uri.parse(url));
        if(response.statusCode==200){
          emit(ProductsLoadedState(productsModelFromJson(response.body)));
        }
      }catch(e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }

}