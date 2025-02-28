import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 440,
              child: Container(
                margin: EdgeInsets.all(0.5),
                padding: EdgeInsets.all(16),
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //color: Colors.amberAccent,
                    image: DecorationImage(
                        image: const AssetImage("assets/images/furniture.png"),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25,
                              color: AppConst.dWhite,
                            ),
                          ),
                          ReusableText(
                            text: "ShareNest",
                            style: TextStyle(
                                color: AppConst.dWhite,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.share,
                        size: 25,
                        color: AppConst.dWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 340,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(20.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppConst.dWhite,
                    borderRadius: BorderRadius.circular(AppConst.dRadius + 3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Cushioned Wooden chair",
                      style: appStyle(
                          size: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //TODO
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, AppRoutes.OTP, (route) => false,
                            //     arguments: {"email": "pikisaikia12@gmail.com"});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppConst.dDarkB),
                          child: ReusableText(
                            text: "Rent Now",
                            style: appStyle(
                                size: 16.sp,
                                color: AppConst.dWhite,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        ReusableText(
                          text: "at Rs. 200/day",
                          style: appStyle(
                              size: 16.sp,
                              color: AppConst.dDarkB,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ReusableText(
                      text: "Details",
                      style: appStyle(
                          size: 16.sp,
                          color: HexColor('585858'),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Premium wooden chair, designed for both comfort and style. Crafted from high-quality solid wood, this chair features a sturdy frame, a smooth polished finish, and an ergonomic design for maximum support.',
                      softWrap: true,
                      style: appStyle(
                          size: 13.sp,
                          color: HexColor('585858'),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ReusableText(
                      text: "Lender details",
                      style: appStyle(
                          size: 16.sp,
                          color: HexColor('585858'),
                          fontWeight: FontWeight.w600),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/images/profile_icon.png",
                      ),
                      title: Text('Alfred Hussain'),
                      subtitle: Text('+91 XXXXX XXXXX'),
                      trailing: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          // Implement chat functionality
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ShareNest'),
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {
//             // Implement menu functionality
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Image.asset(
//               'assets/chair_image.png', // Replace with your image path
//               width: double.infinity,
//               height: 300,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Title and Price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Cushioned Wooden chair',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'at Rs. 200/day',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   // Rent Now Button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Implement rent now functionality
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 48),
//                     ),
//                     child: Text('Rent Now'),
//                   ),
//                   SizedBox(height: 16),
//                   // Details Section
//                   Text(
//                     'Details',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Premium wooden chair, designed for both comfort and style. Crafted from high-quality solid wood, this chair features a sturdy frame, a smooth polished finish, and an ergonomic design for maximum support.',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Lender Details Section
//                   Text(
//                     'Lender Details',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   ListTile(
//                     leading: CircleAvatar(
//                       child: Icon(
//                           Icons.person), // Replace with lender's profile image
//                     ),
//                     title: Text('Alfred Hussain'),
//                     subtitle: Text('+91 XXXXX XXXXX'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.message),
//                       onPressed: () {
//                         // Implement chat functionality
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Implement favorite functionality
//         },
//         child: Icon(Icons.favorite_border),
//       ),
//     );
//   }
// }
