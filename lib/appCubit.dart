import 'dart:developer';

import 'package:demo_project/app_state.dart';
import 'package:demo_project/repos/user_repo.dart';
import 'package:demo_project/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit({required this.userRepo, required this.userData}) : super(UnauthenticatedAppState()){
    fetchToken();
  }

  UserRepo userRepo;
  UserData userData;

  fetchToken() async {
    try{
      String token = await userRepo.fetchToken();
      userData = userData.copyWith(token: token);
      emit(AuthenticatedAppState());
    }
    catch (e){
      emit(ErrorAppState(error: e.toString()));
    }
  }
}