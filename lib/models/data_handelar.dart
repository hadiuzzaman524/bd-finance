import 'package:bd_finance/models/customer_details.dart';
import 'package:bd_finance/models/loan_deposit.dart';
import 'package:bd_finance/models/visituser.dart';
import 'package:bd_finance/screens/appoinment.dart';
import 'package:bd_finance/screens/visit_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'client_appointment.dart';

class DataHandelar {
  static const _subtitle =
      "Lorem Ipsum is simply dummy text of the printing and industry. Lorem Ipsum has been the main industry's standard dummy text ever since the 1500s.";
  static const _imageUrl =
      "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI";

  List<LoanDeposit> loanList = [
    LoanDeposit(
        title: "Lease Finance", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Term Finance", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Syndication Finance", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Bridge Finance", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Commercial Home Loan",
        subtitle: _subtitle,
        imageUrl: _imageUrl),
    LoanDeposit(
        title: "Working Capital", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(title: "Auto Loan", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Personal Loan", subtitle: _subtitle, imageUrl: _imageUrl),
  ];
  List<LoanDeposit> depositList = [
    LoanDeposit(
        title: "Term Deposit", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Double Money Deposit Scheme",
        subtitle: _subtitle,
        imageUrl: _imageUrl),
    LoanDeposit(
        title: "Monthly Deposit Scheme",
        subtitle: _subtitle,
        imageUrl: _imageUrl),
    LoanDeposit(
        title: "Lakhopoti Deposit Scheme",
        subtitle: _subtitle,
        imageUrl: _imageUrl),
    LoanDeposit(
        title: "Cumulative Deposit", subtitle: _subtitle, imageUrl: _imageUrl),
    LoanDeposit(
        title: "Profit First Deposit",
        subtitle: _subtitle,
        imageUrl: _imageUrl),
    LoanDeposit(
        title: "Profit Earners Scheme ",
        subtitle: _subtitle,
        imageUrl: _imageUrl),
    LoanDeposit(
        title: "Platinum Deposit", subtitle: _subtitle, imageUrl: _imageUrl),
  ];

  List<VisitUserInfo> visitUserList = [
    VisitUserInfo(
        title: "Md. Hadiuzzaman", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Md. Ashraful Islam", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Asaduzzaman Sarker", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Mantasha Mustarin", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Abdul Hamid", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Fariha Sultana", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Jerin Akter", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Fahima Akter", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Binoyee Arefin", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Shahariar Konok", subtitle: _subtitle, imageUrl: _imageUrl),
    VisitUserInfo(
        title: "Najmun Oishi", subtitle: _subtitle, imageUrl: _imageUrl),
  ];

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
