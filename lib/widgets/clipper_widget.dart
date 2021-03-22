import 'package:flutter/cupertino.dart';

class ClipperWidget extends CustomClipper<Path> {
  final List<Offset>waveList;
  ClipperWidget({this.waveList});
@override
  getClip(Size size) {
    // TODO: implement getClip
    final Path  path =Path();
        path.addPolygon(waveList, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
