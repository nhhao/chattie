import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () => FirebaseAuth.instance.signOut(),
        child: const Text('Sign out'),
      ),
    );
  }
}
