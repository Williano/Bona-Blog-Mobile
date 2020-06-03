import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
