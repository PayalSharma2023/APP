import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/pages/home.dart';
import 'package:twitter_clone/pages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twitter_clone/providers/user_provider.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //   ),
      //  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: StreamBuilder<User? >(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            ref.read(userProvider.notifier).login(snapshot.data!.email!);
            return const Home();
          }
          return const Signin();
        }
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
