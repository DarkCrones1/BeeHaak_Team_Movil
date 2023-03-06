
import 'package:bee_haak_app/page/adminstrator_pages/add_category.dart';
import 'package:bee_haak_app/page/adminstrator_pages/add_page.dart';
import 'package:bee_haak_app/page/adminstrator_pages/add_product.dart';
import 'package:bee_haak_app/page/adminstrator_pages/home_admin.dart';
import 'package:bee_haak_app/page/adminstrator_pages/watch_users.dart';
import 'package:flutter/material.dart';


class NavegationBarAdmin extends StatefulWidget {
  const NavegationBarAdmin({super.key});

  @override
  State<NavegationBarAdmin> createState() => _NavegationBarAdminState();
}

class _NavegationBarAdminState extends State<NavegationBarAdmin> {
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
          NavigationDestination(icon: Icon(Icons.add), label: 'Choose'),
          NavigationDestination(icon: Icon(Icons.people), label: 'User'),
        ],
      ),
      body: <Widget>[
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: HomeAdmin()
        ),
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: AdminAdd()
        ),
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: AdminWatchUser()
        ),
      ][currentPageIndex],
    );
  }
}