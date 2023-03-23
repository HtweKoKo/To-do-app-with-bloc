

Future<String> textApi()async{
   await Future.delayed(Duration(seconds: 3));
    // return "This is Text";
    return Future.error("error");
    

}