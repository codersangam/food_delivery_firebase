import 'package:flutter/material.dart';

class Utils {
  static void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed, {
    bool isConfirmDialog = false,
    String buttonText2 = '',
    Function? onPressed2,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // ignore: void_checks
                  return onPressed();
                },
                child: Text(buttonText),
              ),
              Visibility(
                visible: isConfirmDialog,
                child: ElevatedButton(
                  onPressed: () {
                    // ignore: void_checks
                    return onPressed2!();
                  },
                  child: Text(buttonText2),
                ),
              )
            ],
          );
        });
  }
}
