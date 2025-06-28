// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:soul_chat/common/utils/utils.dart';
// import 'package:soul_chat/models/user_model.dart';
// import 'package:soul_chat/routes/route_name.dart';

// final selectContactRepositoryProvider = Provider(
//   (ref) => SelectContactRepository(
//     firestore: FirebaseFirestore.instance,
//   ),
// );

// class SelectContactRepository {
//   final FirebaseFirestore firestore;
//   SelectContactRepository({required this.firestore});

//   // Future<List<Contact>> getContacts() async {
//   //   List<Contact> contacts = [];
//   //   try {
//   //     if (await FlutterContacts.requestPermission()) {
//   //       contacts = await FlutterContacts.getContacts(withProperties: true);
//   //     }
//   //   } catch (e) {
//   //     debugPrint(e.toString());
//   //   }
//   //   return contacts;
//   // }

//   void selectContact(Contact selectedContact, BuildContext context) async {
//     try {
//       final userCollection = await firestore.collection('users').get();
//       bool isFound = false;

//       for (var document in userCollection.docs) {
//         var userData = UserModel.fromMap(document.data());
//         String selectedPhoneNumber =
//             selectedContact.phones[0].number.replaceAll(' ', "");

//         if (selectedPhoneNumber == userData.phoneNumber) {
//           isFound = true;
//           context.pushNamed(RouteName.mobileChatScreen, queryParameters: {
//             'name': userData.name,
//             'uid': userData.uid,
//             'profilePic': userData.profilePic
//           });
//         }
//         if (!isFound) {
//           showSnackBar(
//               context: context,
//               content: "This Number does not exist in this app");
//         }
//         print(selectedContact.phones[0].number);
//       }
//     } catch (e) {}
//   }
// }
