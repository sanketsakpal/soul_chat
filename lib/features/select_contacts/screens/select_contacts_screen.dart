// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:soul_chat/common/widgets/error_screen.dart';
// import 'package:soul_chat/common/widgets/loader.dart';
// import 'package:soul_chat/features/select_contacts/controller/select_contacts_controller.dart';

// class SelectContactsScreen extends ConsumerWidget {
//   const SelectContactsScreen({super.key});

//   void selectContact(
//       WidgetRef ref, Contact selectedContact, BuildContext context) {
//     final selectContactsController = ref.read(selectContactsControllerProvider);
//     selectContactsController.selectedContacts(selectedContact, context);
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Select contact'),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.more_vert,
//             ),
//           ),
//         ],
//       ),
//       body: ref.watch(getContactsProvider).when(
//             data: (contactList) => ListView.builder(
//               itemCount: contactList.length,
//               itemBuilder: (context, index) {
//                 final contact = contactList[index];
//                 return InkWell(
//                   onTap: () => selectContact(ref, contact, context),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       leading: contact.photo == null
//                           ? const CircleAvatar()
//                           : CircleAvatar(
//                               backgroundImage: MemoryImage(
//                                 contact.photo!,
//                               ),
//                               radius: 30,
//                             ),
//                       title: Text(
//                         contact.displayName,
//                         style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             error: (e, stackTrace) => ErrorScreen(error: e.toString()),
//             loading: () => const Center(
//               child: Loader(),
//             ),
//           ),
//     );
//   }
// }
