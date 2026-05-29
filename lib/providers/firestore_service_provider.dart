import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/services/firestore_service.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final userProfileProvider = FutureProvider<DocumentSnapshot<Map<String, dynamic>>>((ref) async {
  final service = ref.read(firestoreServiceProvider);
  return service.getUserProfile('u8RDGMU0pyuH00MkH5o6');
});