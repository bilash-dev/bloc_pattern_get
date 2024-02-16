import 'package:bloc_get_data/screens/products_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Pattern'),),
      body: Center(child: TextButton(
        child: const Text('Get Started'),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsScreen()));
      },),),
    );
  }
}
