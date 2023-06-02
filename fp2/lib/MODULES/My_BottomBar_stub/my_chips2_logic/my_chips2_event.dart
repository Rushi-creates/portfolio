part of 'my_chips2_bloc.dart';

abstract class MyChips2Event extends Equatable {
  const MyChips2Event();

  @override
  List<Object> get props => [];
}

class SongChipClicked_Event extends MyChips2Event {}

class MoviesChipClicked_Event extends MyChips2Event {}

class YoutubeChipClicked_Event extends MyChips2Event {}

class CustomChipClicked_Event extends MyChips2Event {}
