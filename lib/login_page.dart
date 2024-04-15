import 'package:flutter/material.dart';
import 'package:smart_scroll_hw/homepage.dart';
import 'package:smart_scroll_hw/show_password_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
// ignore_for_file: prefer_const_constructors

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  bool _wrongPassword = false;
  String sampleEmail = "sample@gmail.com";
  String samplePassword = "password";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login_background.png"),
                  fit: BoxFit.cover)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GİRİŞ YAP",
                  style: TextStyle(
                      color: Color(0xFF313586),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      fontFamily: "Times New Roman"),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mail Adresi",
                            style: TextStyle(
                                color: Color(0xFF313586),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: "Times New Roman"),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "example@gmail.com"),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Şifre",
                            style: TextStyle(
                                color: Color(0xFF313586),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: "Times New Roman"),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: !_isVisible,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: showPasswordIcon(
                                    onChanged: (value) {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              _wrongPassword
                                  ? "Kullanıcı adı veya şifre hatalı"
                                  : "",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 114, 118, 188))),
                              onPressed: () {
                                String inputEmail = _emailController.text;
                                String inputPassword = _passwordController.text;

                                if (inputPassword == samplePassword &&
                                    inputEmail == sampleEmail) {
                                  print("Login successfull");
                                  _wrongPassword = false;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                } else {
                                  print("Login unsuccessfull");
                                  setState(() {
                                    _wrongPassword = true;
                                  });
                                  print(_wrongPassword);
                                }
                              },
                              child: Text(
                                "Giriş",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
