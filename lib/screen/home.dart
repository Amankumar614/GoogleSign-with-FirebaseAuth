import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import '../services/firebaseSignin.dart';

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  
  @override
  Widget build(BuildContext context) {
    print("this is the user from home $user");
    return Scaffold(
      
      backgroundColor: Colors.blueGrey[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello 😊",style: TextStyle(fontSize: 20),),
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              radius: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(user.displayName!,style:const TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            Text(user.email!,style:const TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Your are currently login with your email id ,if you wanted to log out press on the button which is given below",style: TextStyle(fontSize: 15),),
            ),
            ElevatedButton(
                onPressed: () {
                  GoogleSignInProvider().logOut();
                },
                child: const Text("logout"))
          ],
        ),
      ),
    );
  }
}
