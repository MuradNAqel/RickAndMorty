part of 'charecters_cubit.dart';

@immutable
abstract class CharectersState {}

class CubitInitial extends CharectersState {}

class CharectersLoaded extends CharectersState {
  final List<Charecter> charecters;

  CharectersLoaded(this.charecters);
}

class CharectersLoading extends CharectersState {
  final List<Charecter> oldCharecters;
  final bool isFirstFetch;

  CharectersLoading(this.oldCharecters, {this.isFirstFetch = false});
}
