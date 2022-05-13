import 'package:chattie/providers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void handleSignOut(WidgetRef ref) async {
    await FirebaseAuth.instance.signOut();
    ref.refresh(currentUserUidProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => Center(
          child: MaterialButton(
        onPressed: () => handleSignOut(ref),
        child: const Text('Sign out'),
      )),
    );
  }
}
