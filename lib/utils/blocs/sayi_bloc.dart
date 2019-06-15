import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/utils/events/sayi_event.dart';
import 'package:flutter_bloc_example/utils/states/sayi_state.dart';

class SayiBloc extends Bloc<SayiEvent, SayiState> {
  @override
  SayiState get initialState => SayiState.initial();

  @override
  Stream<SayiState> mapEventToState(SayiEvent event) async* {
    final _currentState = currentState;
    if (event is SayiArttirEvent) {
      yield SayiState(sayi: _currentState.sayi + 1);
    } else if (event is SayiAzaltEvent) {
      yield SayiState(sayi: _currentState.sayi - 1);
    }
  }

  void onArttir() {
    dispatch(SayiArttirEvent());
  }

  void onAzalt() {
    dispatch(SayiAzaltEvent());
  }
}
