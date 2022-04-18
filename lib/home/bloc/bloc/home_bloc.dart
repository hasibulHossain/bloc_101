import 'package:bloc/bloc.dart';
import 'package:bloc_one_o_one/services/bored_service.dart';
import 'package:bloc_one_o_one/services/conectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  final ConnectivityService _connectivityService;

  HomeBloc(this._boredService, this._connectivityService) : super(HomeLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      print('from no internet event');
      if(event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>(_onLoadApi);
    on<NoInternetEvent>(_onNoInternet);
  }

  Future<void> _onLoadApi(LoadApiEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final activity = await _boredService.getBoredActivity();
    emit(HomeLoadedState(activityName: activity.activity, activityType: activity.type, participants: activity.participants));
  }

  void _onNoInternet(NoInternetEvent event, Emitter<HomeState> emit) {
    emit(HomeNoInternetState());
  }
}
