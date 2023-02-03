import 'package:bee_haak_app/widget/buttons/button_navegation.dart';
import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: const [
          ButtonPage(icon: Icons.menu, ruta: '/option_page', ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Bee Haak', style: 
          TextStyle(
            fontSize: 50,
            fontFamily: 'ROBOTO',
          ),),
          SizedBox(
            width: 350,
            height: 30,
            child: TextField(
              controller: search,
              decoration: const InputDecoration(
                filled: false,
                // suffixIcon: IconButton(onPressed: , icon: Icon(Icons.search)),
                labelText: 'search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    search.clear();
                  }
                ),
              TextButton(
                  child: const Text('search'),
                  onPressed: (){
                    Navigator.restorablePushNamedAndRemoveUntil(context, '', (route) => false);
                  },
                )
            ],
          ),
          const SizedBox(height: 30,),
          const Expanded(
            child: ListViewProduct(cantidad: 4),
          ),
        ],
      )
    );
  }
}
