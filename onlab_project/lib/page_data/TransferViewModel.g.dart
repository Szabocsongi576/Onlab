// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransferViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransferViewModel on _TransferViewModel, Store {
  final _$transferListAtom = Atom(name: '_TransferViewModel.transferList');

  @override
  ObservableList<TransferItemModel> get transferList {
    _$transferListAtom.context.enforceReadPolicy(_$transferListAtom);
    _$transferListAtom.reportObserved();
    return super.transferList;
  }

  @override
  set transferList(ObservableList<TransferItemModel> value) {
    _$transferListAtom.context.conditionallyRunInAction(() {
      super.transferList = value;
      _$transferListAtom.reportChanged();
    }, _$transferListAtom, name: '${_$transferListAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_TransferViewModel.state');

  @override
  TransferState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(TransferState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$loadTransferItemsAsyncAction = AsyncAction('loadTransferItems');

  @override
  Future<void> loadTransferItems() {
    return _$loadTransferItemsAsyncAction.run(() => super.loadTransferItems());
  }

  final _$_TransferViewModelActionController =
      ActionController(name: '_TransferViewModel');

  @override
  void addTransferItem(TransferItemModel newItem) {
    final _$actionInfo = _$_TransferViewModelActionController.startAction();
    try {
      return super.addTransferItem(newItem);
    } finally {
      _$_TransferViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTransferItem(String id) {
    final _$actionInfo = _$_TransferViewModelActionController.startAction();
    try {
      return super.removeTransferItem(id);
    } finally {
      _$_TransferViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTransferItem(TransferItemModel changedItem) {
    final _$actionInfo = _$_TransferViewModelActionController.startAction();
    try {
      return super.updateTransferItem(changedItem);
    } finally {
      _$_TransferViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'transferList: ${transferList.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
