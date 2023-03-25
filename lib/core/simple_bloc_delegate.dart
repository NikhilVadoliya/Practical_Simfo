import 'package:simform_practical/core/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogger.i('Bloc Created : ${bloc.toString()}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.i('Bloc onClose : ${bloc.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.i('Bloc onError : ${bloc.toString()} \n Error : ${error.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    AppLogger.i(
        'Bloc onChange : ${bloc.toString()} \n Event :  ${transition.event} \n Current State : ${transition.currentState} \n Next State ${transition.nextState}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.i(
        'Bloc onChange : ${bloc.toString()} \n Current State : ${change.currentState} \n Next State ${change.nextState}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.i('Bloc onEvent : ${bloc.toString()} \n Event : $event');
  }
}
