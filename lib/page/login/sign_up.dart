
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final eMailUser = TextEditingController();
  final passWordUser = TextEditingController();
  bool _passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: ListView(
          children:  <Widget> [
            Image.asset(
                  'image/beehaak.png',
                  height: 200,
                  width: 200,
                ),
            Padding(
              padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'User',
                  suffixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: name,
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
              child: TextField(
                controller: passWordUser,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
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
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: passWordUser,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
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
            const SizedBox(
              height: 20,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton.icon(onPressed: () => Navigator.pop(context,), icon: const Icon(Icons.create), label: const Text('Create Account')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
