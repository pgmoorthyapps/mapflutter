import 'package:flutter/material.dart';
import 'package:maptest/pages/profile_page.dart';
import 'package:maptest/widgets/textbox_widget.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/heading_widget.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final GlobalKey<FormState> passwordForm = GlobalKey<FormState>();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  bool obscureText1 = true;
  bool obscureText2 = true;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required.';
    }
    if (value != passwordCtrl.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  Future<void> createPassword() async {
    if (!passwordForm.currentState!.validate()) return;
    Navigator.push(context, MaterialPageRoute(builder: (builder)=> ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(25),
              child: Form(
                key: passwordForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                     Center(
                      child: Image.asset(
                        AppAssets.logo,
                        width: MediaQuery.of(context).size.width - 200.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    HeadingWidget(
                      title: 'Create Password',
                      fontSize: 24.0,
                    ),
                    const SizedBox(height: 20),
                    TextBoxWidget(
                      labelText: 'New Password',
                      control: passwordCtrl,
                      obscureText: obscureText1,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(obscureText1
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            obscureText1 = !obscureText1;
                          });
                        },
                      ),
                      validator: validatePassword,
                    ),
                    // const SizedBox(height: 20),
                    TextBoxWidget(
                      labelText: 'Confirm Password',
                      control: confirmPasswordCtrl,
                      obscureText: obscureText2,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(obscureText2
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            obscureText2 = !obscureText2;
                          });
                        },
                      ),
                      validator: validateConfirmPassword,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      title: 'Submit',
                      onTap: createPassword,
                      borderRadius: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
