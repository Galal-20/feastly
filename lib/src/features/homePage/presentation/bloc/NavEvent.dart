abstract class NavEvent {}

class NavItemSelected extends NavEvent {
  final int index;
  NavItemSelected(this.index);
}
