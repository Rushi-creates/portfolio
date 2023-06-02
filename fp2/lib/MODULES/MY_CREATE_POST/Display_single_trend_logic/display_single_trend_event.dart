part of 'display_single_trend_bloc.dart';

abstract class DisplaySingleTrendEvent<T> extends Equatable {
  const DisplaySingleTrendEvent();

  @override
  List<Object> get props => [];
}

class AddTrend_Event<T> extends DisplaySingleTrendEvent<T> {
  final trend;

  AddTrend_Event(this.trend);
  @override
  List<Object> get props => [trend];
}

class RemoveTrend_Event<T> extends DisplaySingleTrendEvent<T> {}
