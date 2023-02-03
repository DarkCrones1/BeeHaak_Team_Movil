import 'package:bee_haak_app/widget/buttons/button_navegation.dart';
import 'package:flutter/material.dart';

class AccountValidation extends StatefulWidget {
  const AccountValidation({super.key});

  @override
  State<AccountValidation> createState() => _AccountValidationState();
}

class _AccountValidationState extends State<AccountValidation> {
  bool accountAcces = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: (accountAcces? const Icon(Icons.account_circle_outlined): const Icon(Icons.account_circle_rounded)), onPressed: () {  },
    );
  }

  accountValidation() => {
      setState(
        (){
          if (accountAcces){
            accountAcces = false;
          }
          else{
            accountAcces = true;
          }
        }
      )
    };
}