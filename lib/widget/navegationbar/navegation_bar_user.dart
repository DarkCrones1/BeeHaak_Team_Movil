

import 'package:bee_haak_app/page/basicpages/shopping_cart_page.dart';
import 'package:bee_haak_app/page/basicpages/store_page.dart';
import 'package:bee_haak_app/page/user_page/home_User.dart';
import 'package:flutter/material.dart';


class NavegationBarUser extends StatefulWidget {
  const NavegationBarUser({super.key});

  @override
  State<NavegationBarUser> createState() => _NavegationBarUserState();
}

class _NavegationBarUserState extends State<NavegationBarUser> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
      body: <Widget>[
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: HomeUser()
        ),
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: Store()
        ),
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: ShoppingCart()
        ),
      ][currentPageIndex],
    );
  }
}
