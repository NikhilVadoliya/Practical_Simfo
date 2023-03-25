import 'package:simform_practical/blocs/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitApplicationState()) {
    on<AddCartItem>((event, emit) {
      int currentCount = state.cartCount;
      emit(UpdatedCartItem(currentCount + 1));
    });
    on<RemoveCartItem>((event, emit) {
      int currentCount = state.cartCount;
      emit(UpdatedCartItem(currentCount - 1));
    });
  }
}
