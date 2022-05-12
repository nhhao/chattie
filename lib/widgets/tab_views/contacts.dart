import 'package:chattie/utils/constants.dart';
import 'package:chattie/widgets/ui/base_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  Future getContacts() async {
    final db = FirebaseFirestore.instance;
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    final contactsResponse =
        await db.collection('contacts').doc(currentUserUid).get();
    final List contactsList = (contactsResponse.data() as Map)['contacts'];

    List contactsWithInfo = [];

    for (String contact in contactsList) {
      final usersResponse = await db.collection('users').doc(contact).get();
      contactsWithInfo.add(usersResponse);
    }

    return contactsWithInfo;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getContacts(),
      builder: (context, snapshot) {
        final contacts = (snapshot.data ?? []) as List;
        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              minVerticalPadding: 0,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: Image.network(
                            contact['avatar_uri'],
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '@${contact['username']}',
                              style: const TextStyle(
                                  fontSize: bodyTextSize,
                                  fontWeight: FontWeight.w600),
                            ),
                            if ((contact['display_name'] as String).isNotEmpty)
                              const SizedBox(
                                height: 2,
                              ),
                            if ((contact['display_name'] as String).isNotEmpty)
                              Text(
                                (contact['display_name'] as String)
                                    .toUpperCase(),
                                style: displayNameTextStyle,
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const BaseDivider(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
