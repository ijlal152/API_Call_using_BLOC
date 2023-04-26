part of 'app_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent{
  @override
  List<Object> get props => [];
}

class OpenUrlEvent extends UserEvent{
  String url;
  OpenUrlEvent({required this.url});
  @override
  List<Object> get props => [];
}


