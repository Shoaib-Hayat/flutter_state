import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(
    const CounterState(
      count: 0,
    ),
  ) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<ResetCounter>(_reset);
  }

  void _increment(
      IncrementCounter event,
      Emitter<CounterState> emit,
      ) {
    emit(
      CounterState(
        count: state.count + 1,
      ),
    );
  }

  void _decrement(
      DecrementCounter event,
      Emitter<CounterState> emit,
      ) {
    emit(
      CounterState(
        count: state.count - 1,
      ),
    );
  }

  void _reset(
      ResetCounter event,
      Emitter<CounterState> emit,
      ) {
    emit(
      const CounterState(
        count: 0,
      ),
    );
  }
}