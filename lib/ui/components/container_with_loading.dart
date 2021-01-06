import 'package:flutter/material.dart';

class ContainerWithLoading extends StatelessWidget {
  final Widget _child;

  ContainerWithLoading({Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
