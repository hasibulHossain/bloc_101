import 'package:bloc/bloc.dart';
import 'package:bloc_one_o_one/services/bored_service.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;

  HomeBloc(this._boredService) : super(HomeLoadingState()) {
    on<LoadApiEvent>(_onLoadApi);
  }

  Future<void> _onLoadApi(LoadApiEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final activity = await _boredService.getBoredActivity();
    emit(HomeLoadedState(activityName: activity.activity, activityType: activity.type, participants: activity.participants));
  }
}
