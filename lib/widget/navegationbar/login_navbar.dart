
import 'package:bee_haak_app/page/login/login_page.dart';
import 'package:bee_haak_app/page/login/sign_up.dart';
import 'package:flutter/material.dart';

class LoginNavBar extends StatefulWidget {
  const LoginNavBar({super.key});

  @override
  State<LoginNavBar> createState() => _LoginNavBarState();
}

class _LoginNavBarState extends State<LoginNavBar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: 'SingIn'),
          NavigationDestination(icon: Icon(Icons.account_circle_rounded), label: 'SingUp')
        ],
      ),
      body: <Widget>[
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: LoginPage()
        ),
        Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: SignUp(),
        ),
      ][currentPageIndex],
    );
  }
}