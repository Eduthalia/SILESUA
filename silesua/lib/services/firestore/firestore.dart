import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  late CollectionReference notesDynamic;
  //get data from the 2firestore
  initializeDatabase(String name) {
    notesDynamic = FirebaseFirestore.instance.collection(name);
  }

  final CollectionReference notes =
      FirebaseFirestore.instance.collection("vents");

  //Create: add note to the fire store
  Future<void> add( String venterId, String venterEmail, String message) {
    return notes.add({
     "venterId": venterId,
      'venterEmail': venterEmail,
      'ventMessage': message,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> addDynaic(
      String venterId, String venterEmail, int price, String message) {
    return notesDynamic.add({
      "venterId": venterId,
      'venterEmail': venterEmail,
      'ventMessage': message,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> addTry(
    String imageName,
  ) {
    return notes.add({"note": imageName, 'timestamp': Timestamp.now()});
  }

  //Retrive: brings up note from the fire store
  Stream<QuerySnapshot> getNotes() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  Stream<QuerySnapshot> getNotesDynamic() {
    final notesStream =
        notesDynamic.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //Update: edit notes with a provided doc id
  Future<void> updateNote(String docId, String imageName, String name,
      String price, String description) {
    return notes.doc(docId).update({
      'imageName': imageName,
      'name': name,
      'price': price,
      'discription': description,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> updateNoteDynamic(String docId, String imageName, String name,
      String price, String description) {
    return notesDynamic.doc(docId).update({
      'imageName': imageName,
      'name': name,
      'price': price,
      'discription': description,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> updateNoteTry(
    String docId,
    String imageName,
  ) {
    return notes.doc(docId).update({
      'note': imageName,
      // 'name': name,
      // 'price': price,
      // 'discription': description,
      // 'timestamp': Timestamp.now()
    });
  }

  //Delete: delete notes with a provided doc id
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }

  Future<void> deleteNoteDynamic(String docID) {
    return notesDynamic.doc(docID).delete();
  }
}
