import 'package:bloc_get_data/bloc/products_bloc.dart';
import 'package:bloc_get_data/bloc/products_event.dart';
import 'package:bloc_get_data/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products Screen'),),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if(state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }else if(state is ProductsLoadedState){
            return ListView.builder(
              itemCount: 10,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Text(state.productsModel[index].id.toString()),
                        title: Text(state.productsModel[index].title.toString()),
                      subtitle: Text(state.productsModel[index].body.toString()),),
                    ),
                  );
                });
          }
          return SizedBox();
        },
      ),
    );
  }
}
