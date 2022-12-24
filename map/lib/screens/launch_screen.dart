import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/components/app_colors.dart';
import 'package:map/cubit/rickandmorty_cubit.dart';
import 'package:map/screens/character_list_screen.dart';

import '../repository/rickandmorty_repository.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  nextScreen() {
    Future.delayed(
      const Duration(seconds: 4),
      (() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => RickandMortyCubit(
                RickandMortyRepositoryImplementation(context),
              ),
              child: const CharacterListScreen(),
            ),
          ),
        );
      }),
    );
  }

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animationController.repeat();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          AnimatedBuilder(
            animation: animationController,
            child: Image.asset('assets/images/portal.png'),
            builder: (BuildContext context, Widget? widget) {
              return Transform.rotate(
                angle: animationController.value * 6.3,
                child: widget,
              );
            },
          ),
        ],
      ),
    );
  }
}
