import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
final _db = FirebaseFirestore.instance;

Future getCurrentUserInfo() async {
  final response = await _db
      .collection('users')
      .where('uid', isEqualTo: currentUserUid)
      .get();
  return response.docs[0].data();
}

Future<List> getCurrentUserContacts() async {
  final response = await _db
      .collection('users')
      .where('uid', isEqualTo: currentUserUid)
      .get();
  final String username = response.docs[0].data()['username'];
  final contactsResponse = await _db.collection('contacts').doc(username).get();
  return (contactsResponse.data() as Map)['contacts'];
}
