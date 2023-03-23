part of 'bloc_bloc.dart';

@immutable
abstract class BlocEvent {}
class Increment extends BlocEvent{}
class Decrement extends BlocEvent{}
class Double extends BlocEvent{}
