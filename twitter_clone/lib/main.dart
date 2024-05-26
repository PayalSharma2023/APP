import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Twitter Clone"),
        ),
        body: Form(
          key: _signInKey,
            child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter an email",
              ),
              validator: (value){
                if(value == null || value.isEmpty) {
                  return "Please enter a email";
                } else if (!emailValid.hasMatch(value)) {
                  return "Please enter a vaild email";
                }
                return null;
              },
            ), //email
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Pasword",
              ),
              validator: (value){
                if(value == null || value.isEmpty) {
                  return "Please enter a password";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ), //password
            ElevatedButton(
                onPressed: () {
                  if (_signInKey.currentState!.validate()) {
                     debugPrint("Email: ${_emailController.text}");
                     debugPrint("Password: ${_passwordController.text}");

                  }
                 
                },
                child: const Text("Submit")),
          ],
        )));
  }
}
