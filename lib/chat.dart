import 'package:chat/Widgets/Chat_messages.dart';
import 'package:chat/Widgets/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine gp'),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
            icon: Icon(Icons.exit_to_app),

            color: Theme.of(context).colorScheme.primary,
          ),

        ],
      ),
      body:const Column(
        children: [

          Expanded(child: chatMessages(),
          ),
          NewMessage(),
        ],
      ));

  }




}