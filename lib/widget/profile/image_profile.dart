import 'package:flutter/material.dart';

class CircleImageProfile extends StatelessWidget {
  const CircleImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 150.0,
      backgroundColor: Colors.white,
      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU'),
    );
  }
}