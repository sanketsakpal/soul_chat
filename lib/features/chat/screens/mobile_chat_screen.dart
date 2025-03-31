import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_chat/features/chat/widgets/chats_list.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/common/widgets/loader.dart';
import 'package:soul_chat/features/auth/controller/auth_controller.dart';
import 'package:soul_chat/features/chat/widgets/bottom_chat_field.dart';

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
          Expanded(
            child: ChatList(
              reciverUserId: uid,
            ),
          ),
          BottomChatField(
            isGroupChat: false,
            recieverUserId: uid,
          ),
        ],
      ),
    );
  }
}
