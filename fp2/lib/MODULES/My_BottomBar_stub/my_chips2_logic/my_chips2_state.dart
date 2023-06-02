part of 'my_chips2_bloc.dart';

abstract class MyChips2State extends Equatable {
  const MyChips2State();

  @override
  List<Object> get props => [];
}

class MyChips2Initial extends MyChips2State {}

class SongChipOpened_State extends MyChips2State {}

class MoviesChipOpened_State extends MyChips2State {}

class YoutubeChipOpened_State extends MyChips2State {}

class CustomChipOpened_State extends MyChips2State {}
