import 'package:bloc_project/bloc/testing/bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestHome extends StatefulWidget {
  const TestHome({Key? key}) : super(key: key);

  @override
  State<TestHome> createState() => _HomeState();
}

class _HomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
  BlocBloc bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Bloc lesson:To do App"),
      actions: [
        
      ],
      ),
      
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        BlocBuilder<BlocBloc, BlocState>(
          builder: (context, state) {
            return Center(
              child: Text(
                state.counterValue.toString(),
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ),
        ElevatedButton(onPressed: (){
            bloc.add(Increment());
        },
         child: Text("Increment")),
        ElevatedButton(onPressed: (){
          context.read<BlocBloc>().add(Decrement());
          // bloc.add(Decrement());
        },
         child: Text("Decrement")),
        ElevatedButton(onPressed: (){
           bloc.add(Double());
        },
         child: Text("Double")),
         BlocListener<BlocBloc,BlocState>(
          listener:((context, state) {
            print(state);
          }),
          child: Text("listener"), )
      ]),
    );
  }
}
