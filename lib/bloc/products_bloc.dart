import 'package:bloc_get_data/bloc/products_event.dart';
import 'package:bloc_get_data/bloc/products_state.dart';
import 'package:bloc_get_data/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/products_model.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState>{
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()){
    on<ProductsLoadedEvent>((event, emit) async{
      emit(ProductsLoadingState());
      try{
        var response = await productsRepo.getProducts();

        emit(ProductsLoadedState(response));

      }catch(e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }

}