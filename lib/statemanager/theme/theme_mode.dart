import 'package:flutter/material.dart';

class LWMOde extends StatefulWidget {
  const LWMOde({super.key});
  @override
  State<LWMOde> createState() => _LWMOdeState();

}

class _LWMOdeState extends State<LWMOde> {

  bool mode = false;

  @override
  Widget build(BuildContext context) {

    return IconButton(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerRight,
      icon: (mode
            ? const Icon(Icons.sunny)
            : const Icon(Icons.mode_night_rounded)),
          onPressed: lwMode,
    );
  }

    lwMode() => {
    setState(
      (){
        if (mode){
          mode = false;
        } else{
          mode = true;
        }
      }
    )
  };
}

