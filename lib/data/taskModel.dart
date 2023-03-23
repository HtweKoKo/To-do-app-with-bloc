import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isdeleted;
  bool? isFavorite;

  TaskModel({required this.title, this.isDone,
   this.isdeleted,required this.id,required this.description,
   required this.date,this.isFavorite
   }) {
    isDone = isDone ?? false;
    isdeleted = isdeleted ?? false;
    isFavorite = isFavorite ?? false;
  }
  TaskModel copyWith({String? title,bool? isDone,bool? isdeleted,String? id,bool? isFavorite}) {
      return TaskModel(
        date: date  ,
        isFavorite: isFavorite ?? this.isFavorite,
        description: description,
        id: id?? this.id,
        title: title ?? this.title,
       isDone: isDone ?? this.isDone,
       isdeleted: isdeleted ?? this.isdeleted 
        );
  }
  Map<String,dynamic> toMap(){
    return {
        "description":description,
        "date":date,
        "isFavorite":isFavorite,
      "id": id,
        "title":title,
        "isDone":isDone,
        "isdeleted":isdeleted
};
  }
  factory TaskModel.fromMap(Map map){
    return TaskModel(
      date: map["date"],
      isFavorite: map["isFavorite"],
      description: map["description"],
      id: map["id"],
      title: map["title"],
      isDone: map["isDone"],
      isdeleted: map["isdeleted"]
      
      );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [title,isdeleted,isDone,date,isFavorite,description,id];

}
