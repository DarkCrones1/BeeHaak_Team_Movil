import 'package:bee_haak_app/Providers/change_theme_provider.dart';
import 'package:bee_haak_app/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SelectTheme extends StatelessWidget {
  const SelectTheme
  ({
    super.key,
  });

  @override
  Widget build(BuildContext context ){

    final theme = Provider.of<ChangeTheme>(context);


    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.sunny),
          onPressed: () => theme.setTheme(ThemeData(colorScheme: lightColorScheme)),
        ),
        IconButton(
          icon: const Icon(Icons.mode_night),
          onPressed: () => theme.setTheme(ThemeData(colorScheme: darkColorScheme)),
        )
      ],
    );
  }
}

