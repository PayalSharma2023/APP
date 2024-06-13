import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/tweet.dart';
import 'package:twitter_clone/providers/tweet_provider.dart';

final feedProvider = StreamProvider.autoDispose<List<Tweet>>((ref){
  return FirebaseFirestore.instance.collection("tweets").orderBy('postTime', descending: true)
  .snapshots()
  .map((event){
    List<Tweet> tweets = [];

    for(int i = 0; i < event.docs.length; i++ ){
    tweets.add(Tweet.fromMap(event.docs[i].data()));

    }
    return tweets;
  });
});

class CreateTweet extends ConsumerWidget {
  const CreateTweet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _tweetController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Post a Tweet"),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 4,
              maxLength: 280,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              controller: _tweetController,
            ),
          ),
           TextButton(onPressed: (){
            ref.read(tweetProvider).postTweet(_tweetController.text);
            Navigator.pop(context);
           },
            child: const Text("Post a Tweet"),)
        ],),
      ),
    );
  }
}