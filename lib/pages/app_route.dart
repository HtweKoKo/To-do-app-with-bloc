import 'package:bloc_project/pages/RecycleBin.dart';
import 'package:bloc_project/pages/pendingPage.dart';
import 'package:bloc_project/pages/tab_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute{
  Route? onGenerateRoute(RouteSettings routeSettings){
      switch(routeSettings.name){
        case RecycleBin.id:
        return MaterialPageRoute(builder: 
        ((_) => RecycleBin())
        );
        case PendingPage.id:
        return MaterialPageRoute(builder: 
        ((_) => PendingPage())
        );
        case TabScreen.id:
        return MaterialPageRoute(builder: 
        ((_) => TabScreen())
        );
        default:
        return null;
      }
  }
}