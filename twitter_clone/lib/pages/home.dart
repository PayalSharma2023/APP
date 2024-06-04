import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/providers/user_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocalUser currentUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: ()=> Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    currentUser.user.ProfilePic
                    ),
                    ),
              ),
            );
          }
        ),

        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                ref.read(userProvider.notifier).logout();
              },
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: [
          Text(currentUser.user.email),
          Text(currentUser.user.name),
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          Image.network(currentUser.user.ProfilePic),
          ListTile(title: Text("Hello, ${currentUser.user.name}",
          style: const TextStyle(fontWeight: FontWeight.bold, 
          fontSize: 18),
          ),),
          ListTile(title: const Text("Settings"),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Settings()));
          },)
        ],)),
    );
  }
}
