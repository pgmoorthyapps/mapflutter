import 'package:flutter/material.dart';
import 'package:maptest/services/comFuncService.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/app_colors.dart';
import '../../widgets/textbox_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/heading_widget.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> profileForm = GlobalKey<FormState>();

  // Controllers for input fields
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  Map<String, String> submittedDetails = {};

  // Validators with detailed error logic
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required.';
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return 'Name must only contain letters.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    if (!emailPattern.hasMatch(value)) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required.';
    }
    if (!RegExp(r"^\d{10}$").hasMatch(value)) {
      return 'Mobile number must be 10 digits.';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required.';
    }
    if (value.length < 5) {
      return 'Address must be at least 5 characters long.';
    }
    return null;
  }

  // Handle Profile Submission
  Future<void> submitProfile() async {
    if (!profileForm.currentState!.validate()) {
      return;
    }

    // Save profile data to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameCtrl.text);
    await prefs.setString('email', emailCtrl.text);
    await prefs.setString('mobile', mobileCtrl.text);
    await prefs.setString('address', addressCtrl.text);

    // Navigate to the confirmation page
    submittedDetails = {
      'Name': nameCtrl.text,
      'Email': emailCtrl.text,
      'Mobile': mobileCtrl.text,
      'Address': addressCtrl.text,
    };
    navEditProfile();
  }

  // Navigation to Edit Profile Page
  navEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(),
      ),
    ).then((value) async {
      if (value != null) {
        if (value['empty'] == true) {
          setState(() {
            nameCtrl.text = '';
            emailCtrl.text = '';
            mobileCtrl.text = '';
            addressCtrl.text = '';
          });
        }
        if (value['edit'] == true) {
          Map<String, String> data = await loadProfileData();

          setState(() {
            nameCtrl.text = data['Name'] ?? '';
            emailCtrl.text = data['Email'] ?? '';
            mobileCtrl.text = data['Mobile'] ?? '';
            addressCtrl.text = data['Address'] ?? '';
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingWidget(
          title: 'Complete Profile',
          color: AppColors.light,
        ),
        actions: [
          IconButton(
              onPressed: navEditProfile, icon: Icon(MdiIcons.circleEditOutline))
        ],
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: profileForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingWidget(
                  title: 'Profile Information',
                  fontSize: 24.0,
                ),
                const SizedBox(height: 20),
                TextBoxWidget(
                  labelText: 'Name',
                  control: nameCtrl,
                  prefixIcon: const Icon(Icons.person),
                  validator: validateName,
                ),
                TextBoxWidget(
                  labelText: 'Email',
                  control: emailCtrl,
                  prefixIcon: const Icon(Icons.email),
                  validator: validateEmail,
                ),
                TextBoxWidget(
                  labelText: 'Mobile Number',
                  control: mobileCtrl,
                  prefixIcon: const Icon(Icons.phone),
                  validator: validateMobile,
                  inputType: 'number',
                  textAlign: TextAlign.start,
                ),
                TextBoxWidget(
                  labelText: 'Address',
                  control: addressCtrl,
                  // prefixIcon: const Icon(Icons.location_on),
                  validator: validateAddress,
                  lines: 5,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  title: 'Submit',
                  onTap: submitProfile,
                  borderRadius: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
