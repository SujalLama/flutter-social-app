import 'package:flutter/material.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/widgets/curve_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Image(
                    image: AssetImage('assets/images/login_background.jpg'),
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'FRENZY',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.account_box,
                          size: 30.0,
                        ),
                        hintText: 'Username'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30.0,
                      ),
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      )),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: 60.0,
                    ),
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 80.0,
                        alignment: Alignment.center,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Don\'t have an account? Sign Up!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
