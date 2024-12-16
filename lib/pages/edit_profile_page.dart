import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_colors.dart';
import '../services/comFuncService.dart';
import '../widgets/button_widget.dart';
import '../widgets/heading_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Map<String, String> details = {
    'Name': '-',
    'Email': '-',
    'Mobile': '-',
    'Address': '-',
  };

  // Clear data from SharedPreferences
  Future<void> clearProfileData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pop(context, {'empty': true}); // Return to the profile form
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    details = await loadProfileData(); // Fetch profile data on page load
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HeadingWidget(
              title: 'Confirmation Details',
              fontSize: 24.0,
            ),
            const SizedBox(height: 20),
            ...details.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    HeadingWidget(
                      title:                      '${entry.key}: ',
                    ),
                    HeadingWidget(
                      title:     entry.value,
                     fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: 'Edit Profile',
                  onTap: () {
                    Navigator.pop(
                        context, {'edit': true}); // Return to Profile Page
                  },
                  borderRadius: 20.0,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  title: 'Clear Data',
                  onTap: () => clearProfileData(context),
                  borderRadius: 20.0,
                  color: AppColors.danger,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
