import 'package:flutter/material.dart';

void navigateWithTransition(BuildContext context, Widget page) {
  Navigator.of(context).push(PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      // Slide + Fade transition
      /*final offsetAnimation = Tween<Offset>(
        begin: Offset(1.0, 0.0), // from right
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

      final fadeAnimation = CurvedAnimation(parent: animation, curve: Curves.easeIn);

       */

      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      /*return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: child,
        ),
      );*/

      return RotationTransition(
        turns: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
        child: FadeTransition(
          opacity: curvedAnimation,
          child: child,
        ),
      );


    },
  ));
}
