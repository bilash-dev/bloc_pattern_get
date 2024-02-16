import 'package:bloc_get_data/models/products_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable{
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends ProductsState{}

class ProductsLoadedState extends ProductsState{
  List<ProductsModel> productsModel;
  ProductsLoadedState(this.productsModel);

  @override
  List<Object> get props => [productsModel];
}

class ProductsErrorState extends ProductsState{
  final String errorMessage;
  ProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}