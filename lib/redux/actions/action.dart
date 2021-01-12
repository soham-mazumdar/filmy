abstract class AppAction{}

class InitAppAction extends AppAction {

  InitAppAction();

  @override @override String toString() {
    return "InitAppAction";
  }
}




class LoadedAction extends AppAction{}

class IsLoadedAction extends AppAction {
  bool isloading;
  IsLoadedAction(this.isloading);

  @override @override String toString() {
    return "IsLoadedAction{$isloading}";
  }
}
