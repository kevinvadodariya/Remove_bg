import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remove_bg/Log_in.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  bool _passwordVisible = true;
  bool _passwordVisible1 = true;

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
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, bottom: 40),
                child: Text(
                  "Registration",
                  style: GoogleFonts.alata(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700)),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 350, // Set the desired width
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            label: Text(
                              "Enter Email",
                            ),
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
                              label: Text(
                                "Enter Password",
                              ),
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        child: TextField(
                          style: TextStyle(color: Colors.brown),
                          controller: _passwordController1,
                          decoration: InputDecoration(
                              label: Text(
                                "Password Confirmation",
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: Colors.blue.shade200, width: 2)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Password Confirmation",
                              prefixIcon: Icon(Icons.key_outlined),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _passwordVisible1
                                      ? Colors.blue
                                      : Colors.blue.shade300,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible1 = !_passwordVisible1;
                                  });
                                },
                              )),
                          obscureText: _passwordVisible1,
                        ),
                      ),
                      SizedBox(height: 15),
                      // Add spacing between the ElevatedButton and TextButton
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
                          var passlength=8;
                          if (_passwordController.text.length <= passlength) {
                            Fluttertoast.showToast(msg: "Password must be at least $passlength characters long");
                          }
                         else if (_passwordController.text ==
                              _passwordController1.text) {
                            final box = GetStorage();
                            box.write('email', _emailController.text);
                            box.write('password', _passwordController.text);
                            box.write('re_password', _passwordController1.text);
                            // print(box.read('email'));
                            // print(box.read('password'));
                            // print(box.read('re_password'));
                            _passwordController.clear();
                            _passwordController1.clear();
                            _emailController.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Log_in(),
                                ));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Password Not Must Match");
                          }
                        },
                        child: Text(
                          "Register",
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
