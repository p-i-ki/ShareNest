import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';
import 'package:share_nest/core/routes/names.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _contactController.dispose();
    _locationController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/auth_screen.png"))),
          child: Stack(children: [
            Positioned(
                top: 70,
                left: 25,
                child: ReusableText(
                    text: "Share with Millions of Other",
                    style: appStyle(
                        size: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Positioned(
              top: 250,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                        height: 400,
                        padding: EdgeInsets.only(
                          top: 28,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppConst.dWhite,
                            borderRadius:
                                BorderRadius.circular(AppConst.dRadius + 3),
                            boxShadow: [
                              BoxShadow(
                                color: AppConst.dgrey,
                                offset: Offset(0, 0),
                                blurRadius: 2,
                              )
                            ]),
                        child: Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              spacing: 16,
                              children: [
                                _buildTextField("Email", "", _emailController),
                                _buildTextField("Name", "", _nameController),
                                _buildTextField(
                                    "Location", "", _locationController),
                                _buildTextField(
                                    "Contact number", "", _contactController),
                                _buildTextField(
                                    "Password", "", _passwordController),
                                _buildTextField("Confirm password", "",
                                    _confirmPasswordController),
                              ],
                            ),
                          ),
                        )),
                    // SizedBox(
                    //   height: 16,
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 80,
              right: 80,
              child: ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppConst.dDarkB),
                child: ReusableText(
                  text: "Create Account",
                  style: appStyle(
                      size: 18.sp,
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
                      text: "Already have an account?",
                      style: appStyle(
                          size: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.INITIAL_ROUTE);
                    },
                    child: ReusableText(
                        text: "Sign In! ",
                        style: appStyle(
                            size: 12.sp,
                            color: AppConst.dDarkB,
                            fontWeight: FontWeight.normal)),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}

Widget _buildTextField(
    String hintText, String textType, TextEditingController controller) {
  return Container(
    height: 45.h,
    width: 280,
    decoration: BoxDecoration(
        border: Border.all(width: 0.0),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w)),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      cursorHeight: 16,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: appStyle(
            size: 16.sp,
            color: HexColor('6B6B6B'),
            fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 8.w),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: AppConst.dgrey,
        fontSize: 16.sp,
      ),
      autocorrect: false,
      obscureText: textType == 'password' ? true : false,
      validator: (value) {
        if (textType == "email") {
          if (value!.isEmpty) {
            return "$hintText is empty!";
          }
          final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if (emailValid != true) {
            return "$hintText is Invalid!";
          }
          return null;
        } else {
          if (value!.isEmpty) {
            return "$hintText is empty!";
          }
          final bool passwordValid = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(value);
          if (passwordValid != true) {
            return "$hintText is Too Weak(example- As1*4mEd@U)!";
          }
          return null;
        }
      },
    ),
  );
}
