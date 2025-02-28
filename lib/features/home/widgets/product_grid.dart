import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

Widget productGrid() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(color: HexColor('88C6FF')),
    ),
    child: Column(
      children: [
        Container(
          height: 125,
          decoration: BoxDecoration(
            color: Colors.redAccent.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(8.w),
            image: DecorationImage(
              image: const AssetImage("assets/images/furniture.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    ),
  );
}
