// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class AppAnimations {
//   static CustomTransitionPage<dynamic> customSlideUpTransition(
//       GoRouterState state, Widget screen) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: screen,
//       transitionDuration: const Duration(milliseconds: 500),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0); // Start from the right
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
//   }

//   static CustomTransitionPage<dynamic> customSlideLeftTransition(
//       GoRouterState state, Widget screen) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: screen,
//       transitionDuration: const Duration(milliseconds: 500),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(1.0, 0.0); // Start from the left
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
//   }

//   static CustomTransitionPage<dynamic> customGrowTransition(
//       GoRouterState state, Widget screen) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: screen,
//       transitionDuration: const Duration(milliseconds: 500),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const curve = Curves.easeInOut;

//         // Define the scale transformation to grow the screen from the center
//         var scaleTween =
//             Tween<double>(begin: 0.7, end: 1.0).chain(CurveTween(curve: curve));
//         var scaleAnimation = animation.drive(scaleTween);

//         // Adjust the fade transition to complement the scale effect
//         var fadeTween =
//             Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
//         var fadeAnimation = animation.drive(fadeTween);

//         return ScaleTransition(
//           scale: scaleAnimation,
//           child: FadeTransition(
//             opacity: fadeAnimation,
//             child: child,
//           ),
//         );
//       },
//     );
//   }
// }
