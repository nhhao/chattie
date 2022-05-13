import 'package:chattie/providers/providers.dart';
import 'package:chattie/utils/constants.dart';
import 'package:chattie/widgets/ui/base_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final contacts = ref.watch(currentUserContactsProvider);

        return contacts.when(
          data: (contacts) {
            if (contacts.isEmpty) {
              return const Center(
                child: Text('You don\'t have any contact'),
              );
            }
            return Center(
              child: ListView.builder(
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
                                  height: 48,
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
                                  if ((contact['display_name'] as String)
                                      .isNotEmpty)
                                    const SizedBox(
                                      height: 2,
                                    ),
                                  if ((contact['display_name'] as String)
                                      .isNotEmpty)
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
              ),
            );
          },
          error: (err, _) => Center(
            child: Text('$err'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
