// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitialPageStore on _InitialPageStore, Store {
  late final _$hasExpandedAtom =
      Atom(name: '_InitialPageStore.hasExpanded', context: context);

  @override
  bool get hasExpanded {
    _$hasExpandedAtom.reportRead();
    return super.hasExpanded;
  }

  @override
  set hasExpanded(bool value) {
    _$hasExpandedAtom.reportWrite(value, super.hasExpanded, () {
      super.hasExpanded = value;
    });
  }

  late final _$displayingSignUpFormAtom =
      Atom(name: '_InitialPageStore.displayingSignUpForm', context: context);

  @override
  bool get displayingSignUpForm {
    _$displayingSignUpFormAtom.reportRead();
    return super.displayingSignUpForm;
  }

  @override
  set displayingSignUpForm(bool value) {
    _$displayingSignUpFormAtom.reportWrite(value, super.displayingSignUpForm,
        () {
      super.displayingSignUpForm = value;
    });
  }

  late final _$_InitialPageStoreActionController =
      ActionController(name: '_InitialPageStore', context: context);

  @override
  void toggleExpanded() {
    final _$actionInfo = _$_InitialPageStoreActionController.startAction(
        name: '_InitialPageStore.toggleExpanded');
    try {
      return super.toggleExpanded();
    } finally {
      _$_InitialPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDisplayingSignUp() {
    final _$actionInfo = _$_InitialPageStoreActionController.startAction(
        name: '_InitialPageStore.toggleDisplayingSignUp');
    try {
      return super.toggleDisplayingSignUp();
    } finally {
      _$_InitialPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasExpanded: ${hasExpanded},
displayingSignUpForm: ${displayingSignUpForm}
    ''';
  }
}
