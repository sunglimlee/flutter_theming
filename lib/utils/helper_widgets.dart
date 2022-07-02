import 'package:flutter/material.dart';


enum BoxSizeForSpace { width, height }

// 이게 바로 어리석은 짓이지.. 쉽게 할 수 있는걸 어렵게 클래스를 또 만들다니.. 그것도 enum 까지 더해서.
class AddBoxSize extends StatelessWidget {
  final BoxSizeForSpace _space;
  final double size;

  // [question : Named parameters can't start with an underscore.]
  // [answer :
  AddBoxSize(this._space, {Key? key, this.size = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_space) {
      case (BoxSizeForSpace.width):
        return SizedBox(width: size);
      case (BoxSizeForSpace.height):
        return SizedBox(height: size);
    }
  }
}
