part of 'app_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModelClass> users;

  UserLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState{
  final String error;
  UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}

class BrowerOpenState extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
