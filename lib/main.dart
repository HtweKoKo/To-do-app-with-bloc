import 'package:bloc_project/bloc/bloc_obvserveer.dart';
import 'package:bloc_project/bloc/task/task_bloc.dart';
import 'package:bloc_project/bloc/testing/bloc_bloc.dart';
import 'package:bloc_project/pages/app_route.dart';
import 'package:bloc_project/pages/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/switch_bloc/switch_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await storage.clear();
  // ignore: deprecated_member_use
  HydratedBloc.storage = storage;
  BlocOverrides.runZoned(
    ()=>runApp(MyApp(appRoute: AppRoute(),)),
   blocObserver: MyBlocObserver()

  );
  

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.appRoute}) : super(key: key);
    final AppRoute appRoute;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
      BlocProvider(create: (context)=>TaskBloc()),
      BlocProvider(create: (context)=>SwitchBloc()),
     ],
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: TabScreen(),
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
}
