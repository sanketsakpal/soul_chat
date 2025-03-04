import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_chat/Widgets/chats_list.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/common/widgets/loader.dart';
import 'package:soul_chat/features/auth/controller/auth_controller.dart';
import 'package:soul_chat/info.dart';
import 'package:soul_chat/models/user_model.dart';

class MobileChatScreen extends ConsumerWidget {
  final String name;
  final String uid;
  final String profilePic;
  const MobileChatScreen(
      {super.key,
      required this.name,
      required this.uid,
      required this.profilePic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataByUserId(uid),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    snapShot.data!.isOnline ? 'Online' : 'Offline',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            }),
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
          TextField(
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
              hintStyle: const TextStyle(color: Colors.white),
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
        ],
      ),
    );
  }
}
