import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../services/firebaseSignin.dart';


class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}
 bool loader=false;
class _signInState extends State<signIn> {

  @override
  Widget build(BuildContext context) {
    return loader==true?const Center(child: CircularProgressIndicator(),):Scaffold(
      backgroundColor: Colors.blueGrey[700],
      
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/pinpng.com-firebase-png-3488129.png'),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(height: 40,
            child: SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () {
                    setState(() {
                      loader=true;
                    });
                     GoogleSignInProvider().googleLogin();
                     setState(() {
                       loader=false;
                     });
                  },
                ),
          ),
        ],
      ),),
    );
  }
}
