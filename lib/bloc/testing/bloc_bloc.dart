import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends HydratedBloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocStateInitial()) {
    on<Increment>((event, emit) =>
     emit(BlocstateIncrement(state.counterValue+1)));
    on<Decrement>((event, emit) => emit(BlocStateDecreasement(state.counterValue -1)),);
    on<Double>((event, emit) =>  emit(BlocStateDouble(state.counterValue *2)));
  }
  
  @override
  BlocState? fromJson(Map<String, dynamic> json) {
  return BlocState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(BlocState state) {
    return state.toMap();
  }
}
