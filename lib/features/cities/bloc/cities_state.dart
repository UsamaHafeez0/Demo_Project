import 'package:demo_project/features/cities/models/city.dart';

abstract class CitiesState{}

class LoadingCitiesState extends CitiesState{}

class ViewCitiesState extends CitiesState{
  CityData cities;

  ViewCitiesState({required this.cities});
}

class ErrorCitiesState extends CitiesState{
  String error;

  ErrorCitiesState({required this.error});
}