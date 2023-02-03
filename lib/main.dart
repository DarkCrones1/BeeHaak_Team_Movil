import 'package:bee_haak_app/color_schemes.g.dart';
import 'package:bee_haak_app/page/basicpages/account_page.dart';
import 'package:bee_haak_app/page/basicpages/home_page.dart';
import 'package:bee_haak_app/page/category/beauty_page.dart';
import 'package:bee_haak_app/page/category/candy_page.dart';
import 'package:bee_haak_app/page/category/nature_page.dart';
import 'package:bee_haak_app/page/login/login_page.dart';
import 'package:bee_haak_app/page/basicpages/news_page.dart';
import 'package:bee_haak_app/page/basicpages/option_page.dart';
import 'package:bee_haak_app/page/basicpages/shopping_cart_page.dart';
import 'package:bee_haak_app/page/basicpages/store_page.dart';
import 'package:bee_haak_app/page/login/recover_pass_page.dart';
import 'package:bee_haak_app/page/login/sing_in.dart';
import 'package:bee_haak_app/widget/navegationbar/login_navbar.dart';
import 'package:bee_haak_app/widget/navegationbar/navegation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:bee_haak_app/page/basicpages/home_page_acces.dart';
// import 'package:bee_haak_app/widget/navegationbar/navegation_bar_acces.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bee Haak',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: false, colorScheme: darkColorScheme),

      themeMode: ThemeMode.dark,

      home: const NavegationBar(),
      routes: {
        '/login':(context) => const LoginNavBar(),
        '/home_navbar':(context) => const NavegationBar(),
        '/home_page':(context) => const Home(),
        '/shoping_cart_page':(context) => const ShoppingCart(),
        '/account_page':(context) => const Account(),
        '/store_page':(context) => const Store(),
        '/option_page':(context) => const OptionPage(),
        '/sing_in':(context) => const SingIn(),
        '/login_page':(context) => const LoginPage(),
        '/news_page':(context) => const NewsPage(),
        '/recover_pass_page':(context) => const RecoverPassPage(),
        '/store_page_1':(context) => const NaturePage(),
        '/store_page_2':(context) => const CandyPage(),
        '/store_page_3':(context) => const BeautyPage(),

      },
    );
  }
}
