import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(ischanged: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(SwitchState(ischanged: true));
    });
    on<SwitchOFFEvent>((event, emit) {
      emit(SwitchState(ischanged: false));
    });
  }
  
  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
   return SwitchState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(SwitchState state) {
  return state.toMap();
  }
}
