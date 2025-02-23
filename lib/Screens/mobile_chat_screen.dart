import 'package:flutter/material.dart';
import 'package:soul_chat/Widgets/chats_list.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/info.dart';

class MobileChatScreen extends StatelessWidget {
  final String name;
  final String uid;
  final String profilePic;
  const MobileChatScreen(
      {super.key,
      required this.name,
      required this.uid,
      required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // scrollPadding: EdgeInsets.only(
              //   bottom: MediaQuery.of(context).viewInsets.bottom + 36,
              // ),
              cursorColor: Colors.white,
              showCursor: true,
              style: const TextStyle(
                color: Colors.white,
              ),

              decoration: InputDecoration(
                filled: true,
                fillColor: mobileChatBoxColor,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    Icons.emoji_emotions,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.money,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                hintText: 'Type a message!',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
