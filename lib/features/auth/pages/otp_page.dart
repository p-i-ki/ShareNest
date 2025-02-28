import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';
import 'package:share_nest/core/routes/names.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Map<dynamic, dynamic> data = {};
  String? _otp;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context)!.settings.arguments as Map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/auth_screen.png"))),
        child: Stack(
          children: [
            Positioned(
              top: 310,
              left: 120,
              right: 120,
              child: ReusableText(
                  text: "Enter OTP",
                  style: appStyle(
                      size: 30,
                      color: HexColor('000000'),
                      fontWeight: FontWeight.w600)),
            ),
            Positioned(
                top: 355,
                left: 85,
                right: 85,
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: HexColor('5B5B5B'), fontSize: 14.sp),
                        children: [
                      TextSpan(text: "Otp sent to ${data["email"]}"),
                      TextSpan(
                          text: "\nDon't share your otp with anyone else."),
                    ]))),
            Positioned(
                top: 340,
                left: 50,
                right: 50,
                child:
                    Container(width: 200, height: 200, child: _pinPutField())),
            Positioned(
              bottom: 250,
              left: 50,
              right: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.HOME_PAGE, (route) => false);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppConst.dDarkB),
                child: ReusableText(
                  text: "Verify",
                  style: appStyle(
                      size: 16.sp,
                      color: AppConst.dWhite,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 120,
              //  right: 50,
              child: Row(
                children: [
                  ReusableText(
                      text: "Didn't get the OTP?",
                      style: appStyle(
                          size: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                  TextButton(
                    onPressed: () {},
                    child: ReusableText(
                        text: "Resend! ",
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
      ),
    );
  }

  Widget _pinPutField() {
    return Pinput(
      length: 4,
      onCompleted: (value) {
        if (value.isNotEmpty) {
          _otp = value;
        }
      },
    );
  }
}
