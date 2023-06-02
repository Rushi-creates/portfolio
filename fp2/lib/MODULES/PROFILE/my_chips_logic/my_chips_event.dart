part of 'my_chips_bloc.dart';

abstract class MyChipsEvent extends Equatable {
  const MyChipsEvent();

  @override
  List<Object> get props => [];
}

class SongChipClicked_Event extends MyChipsEvent {}

class MoviesChipClicked_Event extends MyChipsEvent {}

class YoutubeChipClicked_Event extends MyChipsEvent {}

class CustomChipClicked_Event extends MyChipsEvent {}
