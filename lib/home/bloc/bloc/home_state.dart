part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final String activityName;
  final String activityType;
  final int participants;

  const HomeLoadedState({required this.activityName, required this.activityType, required this.participants});

  @override
  // TODO: implement props
  List<Object> get props => [activityName, activityType, participants];
}

class HomeNoInternetState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


