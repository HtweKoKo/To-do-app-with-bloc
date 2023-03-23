part of 'bloc_bloc.dart';


 class BlocState extends Equatable{
  final int counterValue;
  BlocState({required this.counterValue});
  List<Object?> get props => [counterValue];
  Map<String,dynamic> toMap(){
    return {
      "counterValue":counterValue
    };
  }
  factory BlocState.fromMap(Map map){
      return BlocState(
        counterValue: map["counterValue"]);
  }
}
class BlocStateInitial extends BlocState{
  BlocStateInitial():super(counterValue: 0);

}
class BlocstateIncrement extends BlocState{
  BlocstateIncrement(int increaseValue): super(counterValue: increaseValue);
  
}
class BlocStateDecreasement extends BlocState{
  BlocStateDecreasement(int decreaseValue):super(counterValue: decreaseValue);
}
class BlocStateDouble extends BlocState{
  BlocStateDouble(int doubleValue):super(counterValue: doubleValue);
}


