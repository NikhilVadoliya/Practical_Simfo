import 'package:simform_practical/routes/navigator_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/splash/splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(LaunchScreen());
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (_, state) {
          if (state is NavigateToHome) {
            Navigator.of(context).pushReplacementNamed(NavigatorRoute.home);
          }
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
