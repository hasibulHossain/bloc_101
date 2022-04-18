// Core

// Flutter Sdks
import 'package:bloc_one_o_one/home/bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Packages

// Providers

// Screens

// Widgets

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc 101'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeLoadedState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.activityName),
                    Text(state.activityType),
                    Text(
                      state.participants.toString(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(LoadApiEvent());
                      },
                      child: Text('reload'),
                    )
                  ],
                ),
              );
            }

            if(state is HomeNoInternetState) {
              return const Center(
                child: Text('No internet'),
              );
            }

            return const Center(
              child: Text('Something went wrong.'),
            );
          },
        ),);
  }
}
