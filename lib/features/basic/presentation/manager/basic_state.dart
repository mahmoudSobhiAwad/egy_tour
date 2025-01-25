part of 'basic_cubit.dart';

@immutable
sealed class BasicState {}

final class BasicInitial extends BasicState {}

final class BaiscChangeBasicIndex extends BasicState {
  final int index;

  BaiscChangeBasicIndex({required this.index});
}

