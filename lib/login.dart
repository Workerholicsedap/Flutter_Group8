/*
-----Code By Group 8-----
Name:MUHAMMAD AFIQ BIN ALUSRIZAN
Name :MUHAMMAD SYABIL  BIN ABU BAKAR
Name :MUHAMMAD AMIRUL BIN AZHAR 
*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'register.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //this statement must be declare first because it will be used in next code
  bool _isObscure3 = true; //use for password , hide the text being edited
  bool visible = false; //to show something or do not show in interface
  final _formkey = GlobalKey<FormState>(); //to check whether the input is valid

//controller for email and password
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

// create a new Firebase Auth instance
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLEET MANAGEMENT'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://drive.google.com/uc?export=view&id=1UfA-90itHMxMdcVxh4zHaykUgn_8K3XV'))),

              width: MediaQuery.of(context)
                  .size
                  .width, //Querying the current media using MediaQuery.of will cause your widget to rebuild automatically whenever the MediaQueryData changes (e.g., if the user rotates their device).
              height: MediaQuery.of(context).size.height * 1,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey, //to check wehther the input is valid
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            //to makesure there is no null in input validation
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            //we decide to ude RegEXP Object to check pattern of input
                            //RegExp Object is a pattern with Properties and Methods.
                            //then we can configure/setting the properties and pattern that we want
                            //Like want input use "@" and abcde
                            if (!RegExp(//the input must have word+@+word
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            //to get value that has been input by user
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText:
                              _isObscure3, //use for password , hide the text being edited
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  //to show password or hide password
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            //to makesure the password is not null

                            //set minimun password to 4
                            RegExp regex = new RegExp(r'^.{4,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 4 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text =
                                value!; //to save value from text password
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //button to login
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          height: 40,
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });

                            //call method sigin at from code below to pass the controller value
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                              color: Color.fromARGB(255, 198, 57, 57),
                              fontSize: 20,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void route() {
    //if user enter button login , it will bring to fleet list interface
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      } else {
        print('Document does not exist on the database');
      }
    });
  }

//to pass the email controller and password controller
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
