import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';
import 'package:share_nest/features/auth/widgets/text_field.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    _descController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        excludeHeaderSemantics: true,
        title: ReusableText(
            text: "Create Listing",
            style: appStyle(
                size: 25, color: AppConst.dgrey, fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppConst.dWhite,
                  borderRadius: BorderRadius.circular(AppConst.dRadius + 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppConst.dgrey,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        color: AppConst.dgrey,
                      )),
                  ReusableText(
                      text: "Add product image",
                      style: appStyle(
                          size: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                height: 450,
                padding: EdgeInsets.only(
                  top: 36,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppConst.dWhite,
                    borderRadius: BorderRadius.circular(AppConst.dRadius + 3),
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
                        _buildTextField("Category", "", _categoryController),
                        _buildTextField("Product Name", "", _nameController),
                        _buildTextField("Description", "", _descController),
                        _buildTextField("Price", "", _priceController),
                        _buildTextField("Location", "", _locationController),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppConst.dDarkB),
              child: ReusableText(
                text: "List It",
                style: appStyle(
                    size: 18.sp,
                    color: AppConst.dWhite,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextField(
    String hintText, String textType, TextEditingController controller) {
  return Container(
    height: 60.h,
    width: 300,
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
