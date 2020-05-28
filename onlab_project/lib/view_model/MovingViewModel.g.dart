// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovingViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovingViewModel on _MovingViewModel, Store {
  final _$transferListAtom = Atom(name: '_TransferViewModel.transferList');

  @override
  ObservableList<MovingItemModel> get movingList {
    _$transferListAtom.reportRead();
    return super.movingList;
  }

  @override
  set movingList(ObservableList<MovingItemModel> value) {
    _$transferListAtom.reportWrite(value, super.movingList, () {
      super.movingList = value;
    });
  }

  final _$stateAtom = Atom(name: '_TransferViewModel.state');

  @override
  MovingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(MovingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$loadTransferItemsAsyncAction =
      AsyncAction('_TransferViewModel.loadTransferItems');

  @override
  Future<void> loadMovingItems() {
    return _$loadTransferItemsAsyncAction.run(() => super.loadMovingItems());
  }

  final _$_TransferViewModelActionController =
      ActionController(name: '_TransferViewModel');

  @override
  void addMovingItem(MovingItemModel newItem) {
    final _$actionInfo = _$_TransferViewModelActionController.startAction(
        name: '_TransferViewModel.addTransferItem');
    try {
      return super.addMovingItem(newItem);
    } finally {
      _$_TransferViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMovingItem(String id) {
    final _$actionInfo = _$_TransferViewModelActionController.startAction(
        name: '_TransferViewModel.removeTransferItem');
    try {
      return super.removeMovingItem(id);
    } finally {
      _$_TransferViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMovingItem(MovingItemModel changedItem) {
    final _$actionInfo = _$_TransferViewModelActionController.startAction(
        name: '_TransferViewModel.updateTransferItem');
    try {
      return super.updateMovingItem(changedItem);
    } finally {
      _$_TransferViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transferList: ${movingList},
state: ${state}
    ''';
  }
}
