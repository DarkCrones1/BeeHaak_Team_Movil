import 'package:bee_haak_app/core/entities/product.dart';
import 'package:bee_haak_app/data/product_repository.dart';
import 'package:flutter/material.dart';

class ListViewProduct extends StatelessWidget {
  final int cantidad;

  const ListViewProduct({
    super.key,
     required this.cantidad,
    });

  @override
  Widget build(BuildContext context) {
    var product = ProductRepository.getProduct(cantidad);

    return Scaffold(
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: ((context, index) => createItemList(context, product[index])),
      ),
    );
  }

  createItemList(BuildContext context, Product product) => ListTile(
    title: Text(product.name),
    subtitle: Text(product.description),
    trailing: displayImage(context, product.imageURL),
    onTap: () => displayAlert(context, product),
  );
  
  displayImage(BuildContext context, String imageURL) => FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: imageURL);

  displayAlert(BuildContext context, Product product) => showDialog(context: context, builder: (context)=> AlertDialog(
    content: Column(
      children: [
        Text(product.name),
        const SizedBox(
          height: 10,
        ),
        displayImage(context, product.imageURL),
        
      ],
    ),
    actions: [
      TextButton(onPressed: ()=> Navigator.pop(context), child: const Text('Cancel', style: TextStyle(color: Colors.black),)),
      ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text('ok'))
    ],
  ));
}