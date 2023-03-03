
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginInicio extends StatefulWidget {
  @override
  _LoginInicioState createState() => _LoginInicioState();
}

class _LoginInicioState extends State<LoginInicio> {
  final _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://api-production-067d.up.railway.app/api/auth/signin'),
        body: json.encode({
          'username': _email,
          'password': _password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Autenticación exitosa, guarda el token
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        final rol = responseData['rol'];

        // Guarda el token utilizando SharedPreferences
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', token);

        // Autenticación exitosa, redirige al usuario a la página de inicio

    //      if (rol == 'Chofer') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const ()),
    //   );
    // } else if (rol == 'Almacen') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const ()),
    //   );
    // } else {
    //   // Si el rol no es "Chofer" ni "Almacen", muestra un mensaje de error
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Error'),
    //       content: Text('Esta aplicación es solo para empleados de Chofer o Almacen.'),
    //       actions: [
    //         TextButton(
    //           child: Text('OK'),
    //           onPressed: () => Navigator.pop(context),
    //         ),
    //       ],
    //     ),
    //   );
    // }

      } else {
        // La autenticación falló, muestra un mensaje de error
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content:
                const Text('Contraseña o Username incorrectas. Inténtalo de nuevo.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Ocurrió un error de red u otro tipo de error
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'No se pudo conectar con el servidor. Inténtalo de nuevo más tarde.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const AlertDialog(
            title: Text("Orientación no compatible"),
            content:
                Text("Por favor, gire su dispositivo en posición Vertical."),
          );
        } else {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/09/24/23/36/construction-worker-956496_960_720.jpg'),
                ),
              ),
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Form(
                        key: _formKey,
                        child: Stack(
                          children: [
                            const HederLoginLogo(),
                            Positioned(
                              left: 20,
                              right: 20,
                              top: 250,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: TextFormField(
                                      keyboardType:
                                          TextInputType.emailAddress,
                                      // ignore: prefer_const_constructors
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        border: const OutlineInputBorder(),
                                        fillColor: Colors
                                            .white, // Agregar el color blanco aquí
                                        filled:
                                            true, // Asegurarse de establecer este en true para que el color de fondo se muestre
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Por favor ingresa tu username';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _email = value!;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Contraseña',
                                        border: OutlineInputBorder(),
                                        fillColor: Colors
                                            .white, // Agregar el color blanco aquí
                                        filled:
                                            true, // Asegurarse de establecer este en true para que el color de fondo se muestre
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Por favor ingresa tu contraseña';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _password = value!;
                                      },
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Validar el formulario
                                      final form = _formKey.currentState;
                                      if (form!.validate()) {
                                        form.save();
                                        _login();
                                      }
                                    },
                                    child: const Text('Iniciar sesión'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        }
      },
    );
  }
}

class HederLoginLogo extends StatelessWidget {
  const HederLoginLogo({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 210,
        // width: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imagenes/Madeza.png',
              width: double.infinity,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}