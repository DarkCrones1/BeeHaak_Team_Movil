
import 'package:bee_haak_app/widget/carrusel/carrusel_image.dart';
import 'package:bee_haak_app/widget/category/category_section.dart';
import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      // backgroundColor: Colors.yellow[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          const Expanded(child: CarruselImage(),),
          Expanded(
            child: Column(
              children: const [
                Text('Category', style: TextStyle(
                  fontFamily: 'ROBOTO',
                  fontSize: 30,
                ),),
                Expanded(child: CategoryListView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}