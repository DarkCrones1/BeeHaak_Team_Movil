import 'package:bee_haak_app/Providers/category_providers.dart';
import 'package:bee_haak_app/Providers/change_theme_provider.dart';
import 'package:bee_haak_app/Providers/user_login_provider.dart';
import 'package:bee_haak_app/Providers/product_beauty_provider.dart';
import 'package:bee_haak_app/Providers/product_candy_provider.dart';
import 'package:bee_haak_app/Providers/user_provider.dart';
import 'package:bee_haak_app/color_schemes.g.dart';
import 'package:bee_haak_app/page/adminstrator_pages/add_category.dart';
import 'package:bee_haak_app/page/adminstrator_pages/add_page.dart';
import 'package:bee_haak_app/page/adminstrator_pages/add_product.dart';
import 'package:bee_haak_app/page/adminstrator_pages/home_admin.dart';
import 'package:bee_haak_app/page/adminstrator_pages/watch_users.dart';
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
import 'package:bee_haak_app/page/login/sign_up.dart';
import 'package:bee_haak_app/page/option_page/theme_page.dart';
import 'package:bee_haak_app/page/user_page/home_User.dart';
import 'package:bee_haak_app/page/user_page/option_user.dart';
import 'package:bee_haak_app/widget/navegationbar/navegation_bar.dart';
import 'package:bee_haak_app/widget/navegationbar/navegation_bar_admin.dart';
import 'package:bee_haak_app/widget/navegationbar/navegation_bar_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/product_nature_provider.dart';
import 'Providers/product_providers.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider()..fetchProduct()
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNatureProvider()..fetchProductNature(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductCandyProvider()..fetchProductCandy(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductBeautyProvider()..fetchProductBeauty(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider()..fetchCategory(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeTheme(ThemeData(colorScheme: darkColorScheme)),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider()..fetchUsers(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserLoginProvider()..fetchLogin(),
        )
      ],
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ChangeTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bee Haak',
      theme: theme.getTheme(),
      // darkTheme: ThemeData(useMaterial3: false, colorScheme: darkColorScheme),
      // themeMode: ThemeMode.dark,
      home: const NavegationBar(),
      routes: {
        '/home_navbar': (context) => const NavegationBar(),
        '/home_page': (context) => const Home(),
        '/home_admin':(context) => const HomeAdmin(),
        '/home_user':(context) => const HomeUser() ,
        '/shoping_cart_page': (context) => const ShoppingCart(),
        '/account_page': (context) => const Account(),
        '/store_page': (context) => const Store(),
        '/option_page': (context) => const OptionPage(),
        '/option_user':(context) => const OptionUser() ,
        '/sign_up': (context) => const SignUp(),
        '/login_page': (context) => const LoginPage(),
        '/news_page': (context) => const NewsPage(),
        '/recover_pass_page': (context) => const RecoverPassPage(),
        '/store_page_Nature': (context) => const PageNature(),
        '/store_page_Candy': (context) => const PageCandy(),
        '/store_page_Beauty': (context) => const PageBeauty(),
        '/option_theme_page':(context) => const ThemePage(),
        '/home_admin_navbar':(context) => const NavegationBarAdmin(),
        '/home_user_navbar':(context) => const NavegationBarUser(),
        '/admin_add':(context) => const AdminAdd(),
        '/admin_category_add_page':(context) => const AdminCategoryAdd(),
        '/admin_product_add_page':(context) => const AdminProductAdd(),
        '/admin_watch_user':(context) => const AdminWatchUser(),
      },
    );
  }
}

