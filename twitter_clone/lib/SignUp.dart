import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signInKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid =
      RegExp(r"^[a-zA-Z0-9.!#$%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _signInKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Sign Up to twitter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),

                Container(
                  margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.circular(30),

                  ),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter an email",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a email";
                      } else if (!emailValid.hasMatch(value)) {
                        return "Please enter a vaild email";
                      }
                      return null;
                    },
                  ),
                ), //email
                

                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 240, 240, 240),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Pasword",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                ), //password
                Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                      onPressed: () {
                        if (_signInKey.currentState!.validate()) {
                          debugPrint("Email: ${_emailController.text}");
                          debugPrint("Password: ${_passwordController.text}");
                        }
                      },
                      child: const Text("SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),)),
                ),
                SizedBox(height: 10,),

                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text("Already have an account ? Log In"))
              ],
            )));
  }
}
