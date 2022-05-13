import 'package:chattie/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final AsyncValue<Map> res = ref.watch(currentUserInfoProvider);
        return res.when(
          data: (res) => Center(
            child: Text(res.toString()),
          ),
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
