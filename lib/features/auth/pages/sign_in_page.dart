import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';
import 'package:share_nest/core/routes/names.dart';
import 'package:share_nest/features/auth/widgets/text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/auth_screen.png"))),
      child: Stack(
        children: [
          // Container(
          //   child: Image.asset("assets/images/auth_screen.png"),
          // ),
          Positioned(
            top: 175,
            left: 50,
            right: 50,
            child: Image.asset(
              "assets/images/profile_icon.png",
              width: 120,
              height: 120,
            ),
          ),
          Positioned(
              top: 510.h,
              right: 50.w,
              child: ReusableText(
                  text: "Forgot your password?",
                  style: appStyle(
                      size: 12.h,
                      color: AppConst.dgrey,
                      fontWeight: FontWeight.normal))),
          Positioned(
            top: 355,
            left: 50,
            right: 50,
            child: Card(
              color: AppConst.dWhite,
              elevation: 4,
              child: Form(
                key: _formKey,
                child: Container(
                  height: 140.h,
                  width: 50.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTextField(
                          "Email/Username", "email", emailController),
                      SizedBox(
                        height: 10.h,
                      ),
                      buildTextField(
                          "Password", "password", passwordController),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                //TODO
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.OTP, (route) => false,
                    arguments: {"email": "pikisaikia12@gmail.com"});
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppConst.dDarkB),
              child: ReusableText(
                text: "Sign in",
                style: appStyle(
                    size: 16.sp,
                    color: AppConst.dWhite,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 90,
            //  right: 50,
            child: Row(
              children: [
                ReusableText(
                    text: "Don't have an account?",
                    style: appStyle(
                        size: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                TextButton(
                  onPressed: () {},
                  child: ReusableText(
                      text: "Create one! ",
                      style: appStyle(
                          size: 12.sp,
                          color: AppConst.dDarkB,
                          fontWeight: FontWeight.normal)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
