import 'dart:async';

import 'package:demo_project/appCubit.dart';
import 'package:demo_project/features/cities/bloc/cities_event.dart';
import 'package:demo_project/features/cities/bloc/cities_state.dart';
import 'package:demo_project/features/cities/models/city.dart';
import 'package:demo_project/repos/cities_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState>{
  CitiesBloc({required this.citiesRepo, required this.appCubit}) : super(LoadingCitiesState()){
    on<LoadCities>(_loadCities);
  }

  CitiesRepo citiesRepo;
  AppCubit appCubit;

  FutureOr<void> _loadCities(LoadCities event, Emitter<CitiesState> emit) async {

    try{
      CityData cities = await citiesRepo.getCitiesList(token: appCubit.userData.token);

      emit(ViewCitiesState(cities: cities));
    }
    catch (e){
      emit(ErrorCitiesState(error: e.toString()));
    }
  }
}