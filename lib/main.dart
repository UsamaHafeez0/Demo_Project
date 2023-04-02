import 'package:demo_project/appCubit.dart';
import 'package:demo_project/app_state.dart';
import 'package:demo_project/features/cities/bloc/cities_bloc.dart';
import 'package:demo_project/features/cities/cities_page.dart';
import 'package:demo_project/repos/cities_repo.dart';
import 'package:demo_project/repos/user_repo.dart';
import 'package:demo_project/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (BuildContext context) => UserRepo(),
    child: BlocProvider(
      create: (BuildContext context) => AppCubit(
        userRepo: context.read<UserRepo>(),
        userData: UserData(),
      ),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: context.watch<AppCubit>().state is UnauthenticatedAppState
          ? const Scaffold(
              body: Center(
                child: Text('Initializing...'), // ideally we would show Splash Screen here
              ),
            )
          : context.watch<AppCubit>().state is ErrorAppState
              ? Scaffold(
                  body: Center(
                    child: Text((context.watch<AppCubit>().state as ErrorAppState).error), // in case anything goes wrong with initializing app
                                                          // like token fetching failed in our case
                  ),
                )
              : RepositoryProvider(
                  create: (BuildContext context) => CitiesRepo(),
                  child: BlocProvider(
                    create: (BuildContext context) => CitiesBloc(
                      citiesRepo: context.read<CitiesRepo>(),
                      appCubit: context.read<AppCubit>(),
                    ),
                    child: const CitiesPage(),
                  ),
                ),
    );
  }
}
