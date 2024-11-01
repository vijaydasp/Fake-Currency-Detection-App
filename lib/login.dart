import 'package:fake_image/add_user.dart';
import 'package:fake_image/login_post.dart';
import 'package:flutter/material.dart';


TextEditingController usernameController1 =
    TextEditingController(text: "chathan");
TextEditingController passwordController1 =
    TextEditingController(text: 'chathan');

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 223, 205, 230),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 115, 151, 218)),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
                controller: usernameController1,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                )),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
                controller: passwordController1,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))))),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 138, 192, 199)),
                  onPressed: () {
                    // String uname = usernameController1.text;
                    Map data = {
                      'Username': usernameController1.text,
                      'Password': passwordController1.text
                    };
                    
                    loginFun(data, context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => UserHome()));
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password'))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => UserRegistrationPage()));
                },
                child: const Text("Don't have an account? "))
          ],
        ),
      ),
    );
  }
}
