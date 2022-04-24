import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:google_signin/screen/home.dart';
import 'package:google_signin/screen/signin.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          
      stream:  FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if (snapshot.hasData) {
          return MyHomePage();
        } else 
        if(snapshot.hasError){
          return
          const Center(child: Text("Some error Occur"),);
        }
        else if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else{
          return
          const signIn();
        }
      },
    ));
  }
}
