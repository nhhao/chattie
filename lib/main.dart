import 'package:chattie/controllers/auth.dart';
import 'package:chattie/firebase_options.dart';
import 'package:chattie/pages/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      builder: (context) {
        return const ProviderScope(
          child: MaterialApp(
            home: App(),
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
          ),
        );
      },
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.hasData ? const HomePage() : const Auth();
      },
    );
  }
}
