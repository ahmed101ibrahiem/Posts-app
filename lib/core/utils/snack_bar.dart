
import 'package:flutter/material.dart';

class SnackBarMessage{
  void showSuccessSnackBar({required BuildContext context,required String mesge}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          mesge,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
  void showErrorSnackBar({required BuildContext context, required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}