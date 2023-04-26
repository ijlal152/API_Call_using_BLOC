import 'package:apicallusingbloc/model/UserModelClass.dart';
import 'package:apicallusingbloc/repos/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'app_event.dart';
part 'app_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async{
      emit(UserLoadingState());
      //print('You emitted the first state');
      final users = await _userRepository.getUserApi();
      emit(UserLoadedState(users));
      try{
        final users = await _userRepository.getUserApi();
        //print(users);
        //List<UserModelClass> userList = users;
        //print(userList[0].firstName);
        emit(UserLoadedState(users));
      }catch (e){
        emit(UserErrorState(e.toString()));
      }
      //emit(AppLoadedState());
    });

    on<OpenUrlEvent>((event, emit) async{
      // try{
      //   String str;
      //   _userRepository.launchUrl(str);
      //   emit(BrowerOpenState());
      // }catch(e){
      //   throw e;
      // }
    });
  }
}
