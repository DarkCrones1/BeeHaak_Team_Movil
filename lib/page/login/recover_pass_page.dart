import 'package:flutter/material.dart';

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({super.key});

  @override
  State<RecoverPassPage> createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final eMailUser = TextEditingController();
  final passWordUser = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password?',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  <Widget>[
          const SizedBox(height: 30),
          FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU'),
          const SizedBox(height: 20,),
            Padding(
              padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                controller: eMailUser,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a correct email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                controller: passWordUser,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the password';
                  }
                  return null;
                },
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}