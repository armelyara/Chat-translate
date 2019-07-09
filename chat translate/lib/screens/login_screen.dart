import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;  
  

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
         inAsyncCall: showSpinner,
        child: Padding(      
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Flexible(
             child: Hero(
                tag: 'logo',
            child: Container(
              height: 200.0,
              child: Image.asset('images/logo.jpg'), 
            )
          ),
        ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
               keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email= value;
               
                
              },
              decoration: InputDecoration(
                hintText: 'Entrez votre email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              obscureText: true,
              textAlign: TextAlign.center,
               
              onChanged: (value) {
                password= value;
                 
              },
              decoration: InputDecoration(
                hintText: 'Entrez votre mot de passe.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                     setState(() {
                      showSpinner = true;
                    });
                     try{
                    final user =await _auth.signInWithEmailAndPassword(email: email, password: password);

                    if (user != null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      } 
                       setState(() {
                      showSpinner = false;
                    });
                     }catch(e){
                      print(e);
                    }
                  },
                  minWidth: 100.0,
                  height: 20.0,
                  child: Text(
                    'Se connecter',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
