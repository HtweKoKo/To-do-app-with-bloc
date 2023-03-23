part of 'switch_bloc.dart';

 class SwitchState extends Equatable {
  final bool ischanged;
  const SwitchState({required this.ischanged});
  
  @override
  List<Object> get props => [ischanged];
  Map<String,dynamic> toMap(){
    return {
      "ischanged": ischanged
    };
  }
  factory SwitchState.fromMap(Map map){
    return SwitchState(
      ischanged: map["ischanged"]
    );
  }
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required super.ischanged});
  
}
