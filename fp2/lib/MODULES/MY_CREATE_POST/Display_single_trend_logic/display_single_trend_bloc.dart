import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'display_single_trend_event.dart';
part 'display_single_trend_state.dart';

class DisplaySingleTrendBloc<T>
    extends Bloc<DisplaySingleTrendEvent<T>, DisplaySingleTrendState<T>> {
  DisplaySingleTrendBloc() : super(TrendRemoved_State()) {
/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
    on<AddTrend_Event<T>>(
        (event, emit) => emit(TrendAdded_State<T>(event.trend)));
    on<RemoveTrend_Event<T>>((event, emit) => emit(TrendRemoved_State<T>()));
  }
}
