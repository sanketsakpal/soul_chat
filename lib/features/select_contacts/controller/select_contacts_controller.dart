// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:soul_chat/features/select_contacts/repository/select_contact_repository.dart';

// final getContactsProvider = FutureProvider((ref) {
//   final selectContactRepository = ref.watch(selectContactRepositoryProvider);
//   return selectContactRepository.getContacts();
// });

// final selectContactsControllerProvider = Provider((ref) {
//   final selectContactRepository = ref.watch(selectContactRepositoryProvider);
//   return SelectContactsController(
//     providerRef: ref,
//     selectContactRepository: selectContactRepository,
//   );
// });

// class SelectContactsController {
//   final Ref providerRef;
//   final SelectContactRepository selectContactRepository;

//   SelectContactsController({
//     required this.providerRef,
//     required this.selectContactRepository,
//   });

//   // void selectedContacts(Contact selectedContact, BuildContext context) async {
//   //   selectContactRepository.selectContact(selectedContact, context);
//   // }
// }
