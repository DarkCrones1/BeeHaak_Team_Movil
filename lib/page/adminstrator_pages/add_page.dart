
import 'package:flutter/material.dart';

class AdminAdd extends StatelessWidget {
  const AdminAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What you to do today?'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/admin_category_add_page'), child: const Text('Category')),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/admin_product_add_page'), child: const Text('Product')),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/admin_watch_user'), child: const Text('Watch Users')),
            ],
          )

        ],
      ),
    );
  }
}