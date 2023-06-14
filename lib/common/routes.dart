import 'package:flutter/material.dart';
import 'package:project/chat/ui/screens/chat_cycle.dart';
import 'package:project/common/route_argument.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments as RouteArgument?;
    switch (settings.name) {
      // case LoginScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ChatCycle.routeName:
        return MaterialPageRoute(builder: (_) => ChatCycle(argument: args!));
    }
    return null;
  }
}
