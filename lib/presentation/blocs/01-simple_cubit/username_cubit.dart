import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String> {
  
  UsernameCubit(): super('no-username') {
    print('UsernameCubit Constructor called');
  }

// debe llamar repositories conectados a datasources
  void setUsername(String username) {
    emit(username);
  }
}


