
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final eMailUser = TextEditingController();
  final passWordUser = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      // backgroundColor: Colors.yellow[800],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Image.asset(
                  'image/beehaak.png',
                  height: 250,
                  width: 250,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: eMailUser,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿forgot password?'),
                    TextButton(
                      child: const Text('Click Here'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/recover_pass_page');
                      },
                    ),
                  ],
                ),
                FilledButton(
                  child: const Text('Sign In'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/account_page');
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton.icon(onPressed: () => Navigator.pushNamed(context, '/sign_up'), icon: const Icon(Icons.arrow_circle_right_outlined), label: const Text('Sign Up')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
