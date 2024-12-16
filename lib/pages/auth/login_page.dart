import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../services/comFuncService.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/textbox_widget.dart';
import '../auth/create_password.dart';
import '../../providers/login_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController otpCtrl = TextEditingController();

  static const mockOTP = "123456";

  // Validators
  String? validateEmail(String? value) {
    final emailPattern =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
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
    if (value.length != 10) {
      return 'Enter a valid 10-digit mobile number.';
    }
    return null;
  }

  String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required.';
    }
    if (value != mockOTP) {
      return 'Invalid OTP.';
    }
    return null;
  }

  Future<void> userLogin(BuildContext context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    if (!loginForm.currentState!.validate()) return;

    loginProvider.setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    loginProvider.setLoading(false);

    if (loginProvider.isOTPMode) {
      if (validateOTP(otpCtrl.text) == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreatePasswordPage()),
        );
      }
    } else {
      showSnackBar(context: context, message: 'OTP is $mockOTP');
      loginProvider.toggleOTPMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(25),
              child: Form(
                key: loginForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 9.5),
                    Center(
                      child: Image.asset(
                        AppAssets.logo,
                        width: MediaQuery.of(context).size.width - 200.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: HeadingWidget(
                        key: ValueKey(loginProvider.isOTPMode
                            ? 'Enter OTP'
                            : loginProvider.isMobileLogin
                                ? 'Mobile Login'
                                : 'Email Login'),
                        title: loginProvider.isOTPMode
                            ? 'Enter OTP'
                            : loginProvider.isMobileLogin
                                ? 'Mobile Login'
                                : 'Email Login',
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (!loginProvider.isOTPMode)
                      TextBoxWidget(
                        labelText: loginProvider.isMobileLogin
                            ? 'Mobile Number'
                            : 'Email',
                        control: loginProvider.isMobileLogin
                            ? mobileCtrl
                            : emailCtrl,
                        prefixIcon: Icon(loginProvider.isMobileLogin
                            ? Icons.phone
                            : Icons.email),
                        width: MediaQuery.of(context).size.width / 1.2,
                        validator: loginProvider.isMobileLogin
                            ? validateMobile
                            : validateEmail,
                      ),
                    if (loginProvider.isOTPMode)
                      TextBoxWidget(
                        labelText: 'Enter OTP',
                        control: otpCtrl,
                        prefixIcon: const Icon(Icons.lock_open),
                        width: MediaQuery.of(context).size.width / 1.2,
                        validator: validateOTP,
                      ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      title: loginProvider.isLoading ? 'Loading...' : 'Submit',
                      onTap: loginProvider.isLoading
                          ? null
                          : () => userLogin(context),
                      borderRadius: 20.0,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        loginProvider.toggleLoginMode();
                      },
                      child: HeadingWidget(
                        title: loginProvider.isMobileLogin
                            ? 'Login with Email'
                            : 'Login with Mobile',
                        fontSize: 16.0,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
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
