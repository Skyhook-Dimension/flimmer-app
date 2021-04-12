import 'package:flutter/material.dart';
import '../services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var token;
  Authservice auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "Flimmer",
                  style: GoogleFonts.montserratAlternates(
                    color: Color(0xffed0039),
                    fontSize: 64,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    var val = await Authservice()
                        .login(emailController.text, passwordController.text);
                    print(val.data);
                    if (val.data['success']) {
                      token = val.data['token'];
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Authenticated'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(val.data['msg']),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Sign in"),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextButton(
                onPressed: () async {
                  try {
                    var val = await Authservice()
                        .signUp(emailController.text, passwordController.text);
                    print(val.data);
                    if (val.data['success']) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(val.data['msg']),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(val.data['msg']),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Sign Up Instead"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
