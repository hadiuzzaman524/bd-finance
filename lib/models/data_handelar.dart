import 'package:bd_finance/models/customer_details.dart';
import 'package:bd_finance/models/loan_deposit.dart';
import 'package:bd_finance/screens/appoinment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'client_appointment.dart';

class DataHandelar extends ChangeNotifier {
  List<LoanDeposit> _loanList = [];
  List<LoanDeposit> _depositList = [];

  Future<void> postLoanAndDeposit(CustomerDetails customer) async {
    try {
      final bucket = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child(FirebaseAuth.instance.currentUser.uid + '.jpg');
      await bucket.putFile(customer.file).whenComplete(() => null);
      final imageUrl = await bucket.getDownloadURL();

      await FirebaseFirestore.instance.collection('customerDetails').doc().set({
        'eventName': customer.name,
        'mobile': customer.mobile,
        'userId': FirebaseAuth.instance.currentUser.uid,
        'address': customer.address,
        'profession': customer.profession,
        'birthday': customer.birthday,
        'makeDeposit': customer.makeDeposite,
        'imageUrl': imageUrl,
      }).catchError((e) {
        print("Error: $e");
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> postAppointment(ClientAppointment appointment) async {

    await FirebaseFirestore.instance.collection('clientAppointment').doc().set({
      'mobile': appointment.mobile,
      'name': appointment.name,
      'birthday': appointment.dateTime,
      'message': appointment.message,
    }).catchError((e) {
      print("Error: $e");
    });


  }
}
