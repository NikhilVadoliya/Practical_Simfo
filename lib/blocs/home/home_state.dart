import 'package:simform_practical/data/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class Ideal extends HomeState {
  const Ideal() : super();

  @override
  List<Object?> get props => [];
}

class Loading extends HomeState {
  @override
  List<Object?> get props => [];
}

class GetUser extends HomeState {
  final List<User> user;

  const GetUser(this.user);

  @override
  List<Object?> get props => [user];
}

class Error extends HomeState {
  final String message;

  const Error(this.message);

  @override
  List<Object?> get props => [message];
}

class RefreshData extends HomeState {
  @override
  List<Object?> get props => [];
}
