import 'package:flutter/material.dart';

class DrawerRoute<T> extends ModalBottomSheetRoute<T> {
  DrawerRoute({
    required super.isScrollControlled,
    required super.settings,
    super.shape,
    super.isDismissible,
    required this.child,
  }) : super(
          builder: (ctx) {
            return child;
          },
          useSafeArea: false,
        );

  final Widget child;

  static final List<DrawerRoute<dynamic>> _histories = [];

  late AnimationController _animationController;

  /// Close all the [DrawerRoute]'s
  static void closeAll() {
    while (_histories.isNotEmpty) {
      close();
    }
  }

  /// Close the latest [DrawerRoute]
  static void close() {
    if (_histories.isNotEmpty) {
      final currentContext = _histories.removeLast().subtreeContext;
      if (currentContext == null) {
        return;
      }
      Navigator.pop(currentContext);
    }
  }

  @override
  AnimationController createAnimationController() {
    _animationController = super.createAnimationController();
    return _animationController;
  }

  void _hide() {
    _animationController.reverse();
  }

  void _show() {
    _animationController.forward();
  }

  @override
  TickerFuture didPush() {
    _histories.add(this);
    if (_histories.length > 1) {
      _histories[_histories.length - 2]._hide();
    }
    return super.didPush();
  }

  @override
  bool didPop(T? result) {
    _histories.remove(this);
    if (_histories.isNotEmpty) {
      _histories.last._show();
    }
    return super.didPop(result);
  }

  @override
  void didReplace(Route? oldRoute) {
    _histories.remove(this);
    super.didReplace(oldRoute);
  }
}
