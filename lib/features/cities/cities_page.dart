import 'package:demo_project/features/cities/bloc/cities_bloc.dart';
import 'package:demo_project/features/cities/bloc/cities_event.dart';
import 'package:demo_project/features/cities/bloc/cities_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  @override
  void initState() {
    super.initState();

    context.read<CitiesBloc>().add(LoadCities());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities'),
      ),
      body: context.watch<CitiesBloc>().state is LoadingCitiesState
          ? const Center(child: CircularProgressIndicator())
          : context.watch<CitiesBloc>().state is ErrorCitiesState
              ? Center(
                  child: Text(
                      (context.watch<CitiesBloc>().state as ErrorCitiesState)
                          .error),
                )
              : BlocBuilder<CitiesBloc, CitiesState>(
                  builder: (context, st) {
                    ViewCitiesState state = st as ViewCitiesState;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      itemCount: state.cities.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Column(
                              children: [
                                Text('ID: ${state.cities.data![index].id}'),
                                Text('Name: ${state.cities.data![index].name}'),
                                Text('Country ID: ${state.cities.data![index].countryId}'),
                                Text('State ID: ${state.cities.data![index].stateId}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
