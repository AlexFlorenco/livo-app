import 'package:mobx/mobx.dart';

part 'initial_page_store.g.dart';

class InitialPageStore = _InitialPageStore with _$InitialPageStore;

abstract class _InitialPageStore with Store {
  @observable
  bool hasExpanded = false;

  @observable
  bool displayingSignUpForm = false;

  @action
  void toggleExpanded() {
    hasExpanded = !hasExpanded;
  }

  @action
  void toggleDisplayingSignUp() {
    displayingSignUpForm = !displayingSignUpForm;
  }
}
