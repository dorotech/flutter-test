import 'package:flutter/material.dart';
import 'package:map/components/app_colors.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          AnimatedRotation(
              turns: 2,
              duration: const Duration(seconds: 4),
              child: Image.asset('assets/images/portal.png')),
        ],
      ),
    );
  }
}
