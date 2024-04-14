import 'package:cloud_firestore/cloud_firestore.dart';

class Vent {
  final String senderId;
  final String senderEmail;
  final String message;
  final Timestamp timestamp;

  Vent({
    required this.senderId,
    required this.senderEmail,
    required this.timestamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      "venterId": senderId,
      "venterEmail": senderEmail,
      "timestamp": timestamp,
      "ventMessage": message,
    };
  }
}
