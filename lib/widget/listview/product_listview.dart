import 'package:bee_haak_app/Providers/product_providers.dart';
import 'package:bee_haak_app/dtos/responses/category_responses_dto.dart';
import 'package:bee_haak_app/dtos/responses/product_responses_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  final int? items;
  const ProductListView({
    super.key,
    this.items,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Consumer<ProductProvider>(
            builder: (context, productProvider, child) =>
                productProvider.isloading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: muestra(items, productProvider),
                          // itemCount: productProvider.product?.length,
                          // itemBuilder: ((context, index) => createItemList(context, productProvider.product![index])),
                          itemBuilder: ((context, index) => createItemList(
                              context, productProvider.product![index])),
                        ),
                      ),)
      ],
    );
  }

  muestra(int? items, ProductProvider productProvider) {
    if (items != null) {
      return items;
    } else {
      return productProvider.product?.length;
    }
  }

  createItemList(
    BuildContext context,
    ProductResponseDto product,
  ) =>
      ListTile(
        // title: Text(product.name),
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: displayImage(
          context,
        ),
        onTap: () => displayAlert(context, product),
      );

  displayImage(
    BuildContext context,
  ) =>
      FadeInImage.assetNetwork(
          placeholder: 'image/loading.gif',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU');

  displayAlert(BuildContext context, ProductResponseDto product) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              children: [
                Text('Category: ${product.category?.name}'),
                const SizedBox(
                  height: 20,
                ),
                Text(product.name),
                const SizedBox(
                  height: 20,
                ),
                displayImage(
                  context,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(product.description),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Precio: ' '${product.price} pesos M.N')
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  )),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Add to cart')),
              // ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text('ok'))
            ],
          ));
}
