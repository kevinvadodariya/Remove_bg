import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remove_bg/Home_page.dart';
import 'package:remove_bg/Reg_form.dart';

class Log_in extends StatefulWidget {
  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200, bottom: 10),
                child: Text(
                  "Login",
                  style: GoogleFonts.alata(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 110, bottom: 20),
                child: Text(
                  "Enter a Beautiful World",
                  style: GoogleFonts.alata(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
                ),
              ),
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 350, // Set the desired width
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            label: Text("Enter Email"),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.blue.shade200,
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Enter Email",
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        child: TextField(
                          style: TextStyle(color: Colors.brown),
                          controller: _passwordController,
                          decoration: InputDecoration(
                              label: Text("Enter Password"),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: Colors.blue.shade200, width: 2)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Enter Password",
                              prefixIcon: Icon(Icons.key_outlined),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _passwordVisible
                                      ? Colors.blue
                                      : Colors.blue.shade300,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )),
                          obscureText: _passwordVisible,
                        ),
                      ),
                      SizedBox(height: 15),
                      // Add spacing between the ElevatedButton and TextButton
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: TextButton(
                          onPressed: () {
                            // Add your onPressed action for the text button here
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          fixedSize:
                              MaterialStateProperty.all<Size>(Size(250, 60)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                        ),
                        onPressed: () {
                          final box = GetStorage();
                          final stored_email = box.read('email');
                          final stored_password = box.read('password');
                          final enteredEmail = _emailController.text;
                          final enteredPassword = _passwordController.text;

                          if (stored_email == enteredEmail &&
                              stored_password == enteredPassword) {
                            _emailController.clear();
                            _passwordController.clear();
                            print(box);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          } else {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Enter Valid Details");
                            }
                            else{
                              Fluttertoast.showToast(
                                  msg: "Invalid Email And Password");
                            }
                          }
                        },
                        child: Text(
                          "Log In",
                          style: GoogleFonts.cabin(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Row(
                          children: [
                            Text(
                              " Don't Have An Account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Registration(),
                                    ));
                              },
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
