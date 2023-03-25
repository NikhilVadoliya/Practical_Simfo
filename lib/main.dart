import 'package:simform_practical/blocs/network/network.dart';
import 'package:simform_practical/core/app_snackbar.dart';
import 'package:simform_practical/injector/injector.dart';
import 'package:simform_practical/routes/navigator_route.dart';
import 'package:simform_practical/blocs/splash/splash_bloc.dart';
import 'package:simform_practical/core/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/app/app.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final messengerKey = GlobalKey<ScaffoldMessengerState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (BuildContext context) => ApplicationBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (BuildContext context) => SplashBloc(),
        ),
        BlocProvider<NetworkBloc>(
          create: (BuildContext context) => NetworkBloc(),
        ),
      ],
      child: BlocListener<NetworkBloc, NetworkState>(
          listener: (context, state) {
            if (state.isConnected != null && !state.isConnected!) {
              messengerKey.currentState?.showSnackBar(AppSnackBar.snackBarNoInternetConnection());
            } else {
              messengerKey.currentState?.hideCurrentSnackBar();
            }
          },
          child: MaterialApp(
            scaffoldMessengerKey: messengerKey,
            title: 'Simform Practical',
            debugShowCheckedModeBanner: false,
            routes: NavigatorRoute.routes,
            initialRoute: NavigatorRoute.root,
          )),
    );
  }
}
