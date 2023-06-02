part of 'display_single_trend_bloc.dart';

abstract class DisplaySingleTrendState<T> extends Equatable {
  const DisplaySingleTrendState();

  @override
  List<Object> get props => [];
}

class TrendAdded_State<T> extends DisplaySingleTrendState<T> {
  final trend;

  TrendAdded_State(this.trend);
  @override
  List<Object> get props => [trend];
}

class TrendRemoved_State<T> extends DisplaySingleTrendState<T> {}
