import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_chat/features/auth/controller/auth_controller.dart';
import 'package:soul_chat/features/chat/repository/chat_repository.dart';
import 'package:soul_chat/models/chat_contact.dart';
import 'package:soul_chat/models/message.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(chatRepository: chatRepository, ref: ref);
});

class ChatController {
  final ChatRepository chatRepository;
  final Ref ref;
  ChatController({required this.chatRepository, required this.ref});

  Stream<List<ChatContact>> chatContacts() {
    return chatRepository.getChatContacts();
  }

  Stream<List<Message>> chatStream(String reciverUserId) {
    return chatRepository.getChatStream(reciverUserId);
  }

  void sendTextMessage(
    BuildContext context,
    String receiverUserId,
    String text,
  ) {
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
              context: context,
              receiverUserId: receiverUserId,
              text: text,
              senderUser: value!),
        );
  }
}
