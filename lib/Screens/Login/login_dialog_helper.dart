import 'package:flutter/material.dart';

/// Dialog Helper for Login Screen
/// Handles all dialog operations related to login functionality
class LoginDialogHelper {
  /// Show simple message dialog with OK button
  static void showMessage(BuildContext context, String message, String okText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Message'),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(okText.toUpperCase()),
            ),
          ],
        );
      },
    );
  }

  /// Show access denied dialog for invalid users
  static void showAccessDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Access Denied'),
          content: const Text('You are an invalid User'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show loading dialog
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Expanded(
                child: Text(message),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Show error dialog with custom title
  static void showErrorDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show success dialog
  static void showSuccessDialog(
      BuildContext context, String message, VoidCallback onOkPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onOkPressed();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show confirmation dialog with Yes/No buttons
  static void showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback onYesPressed, {
    VoidCallback? onNoPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onNoPressed != null) {
                  onNoPressed();
                }
              },
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onYesPressed();
              },
              child: const Text('YES'),
            ),
          ],
        );
      },
    );
  }

  /// Show success popup with auto-dismiss after 1 second
  /// Migrated from methods.dart
  static void showsuccessPopUp(
      BuildContext context, String message, VoidCallback onDismissed) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Message'),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(message),
            ),
          ],
        );
      },
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
      print('Pop-up dismissed');
      onDismissed();
    });
  }

  /// Show simple message dialog (legacy version from methods.dart)
  /// Note: This is similar to showMessage() but kept for backward compatibility
  static void showmessage(BuildContext context, String message, String ok) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Message'),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Show simple popup without auto-dismiss
  /// Migrated from methods.dart
  static void showSimplePopUp(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Message'),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Common row widget for displaying image, text, and number
  /// Migrated from methods.dart
  static Widget commonRow(String imagePath, String text, int number) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          number.toString(),
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
      ],
    );
  }
}
