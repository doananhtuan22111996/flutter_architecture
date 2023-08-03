// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../app_icon_widget.dart';
//
// class AppChipWidget extends StatelessWidget {
//   const AppChipWidget({
//     Key? key,
//     required this.icon,
//     this.iconColor,
//     this.isDot = false,
//     this.onTap,
//   }) : super(key: key);
//
//   final IconData icon;
//   final Color? iconColor;
//   final Function()? onTap;
//   final bool isDot;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Stack(
//         children: [
//           Container(
//             width: 40,
//             height: 32,
//             decoration: BoxDecoration(
//               color: context.theme.backgroundColor,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             alignment: Alignment.center,
//             child: AppIconWidget(icon, iconSize: 20, iconColor: iconColor,),
//           ),
//           if (isDot)
//             Positioned(
//               top: 6,
//               right: 10,
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: context.theme.errorColor,
//                 ),
//                 width: 8,
//                 height: 8,
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
