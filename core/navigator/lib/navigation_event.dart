
import 'package:navigator/navigation_types.dart';

abstract class NavigationEvent {}

class NavigateToMain implements NavigationEvent {}

class NavigateToLogin implements NavigationEvent {}

class NavigateToRoute implements NavigationEvent {
  final String route;
  final NavigationType navigationType;

  NavigateToRoute(this.route, this.navigationType);
}

