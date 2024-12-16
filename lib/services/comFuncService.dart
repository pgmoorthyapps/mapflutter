// Custom snack bar
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_colors.dart';

void showSnackBar(
    {required context,
    String? message = 'Processing...',
    bool? showClose = true,
    String? closeLabel = 'Close'}) {
  ScaffoldMessenger.of(context)
      .removeCurrentSnackBar(); // Close previous Snackbar
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message.toString()),
    action: showClose == true
        ? SnackBarAction(
            label: closeLabel!,
            textColor: AppColors.light,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          )
        : null,
  ));
}

closeSnackBar({required context}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}

// Load stored profile data from SharedPreferences
Future<Map<String, String>> loadProfileData() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'Name': prefs.getString('name') ?? 'Not Set',
    'Email': prefs.getString('email') ?? 'Not Set',
    'Mobile': prefs.getString('mobile') ?? 'Not Set',
    'Address': prefs.getString('address') ?? 'Not Set',
  };
}
