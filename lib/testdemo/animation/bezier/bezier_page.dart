import 'package:flutter/material.dart';


class BezierPage extends StatefulWidget {

  @override
  _BezierPageState createState() => new _BezierPageState();
}

class _BezierPageState extends State<BezierPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: CustomPaint(painter: BezierPainter(),),
    );
  }

}

class BezierPainter extends CustomPainter{

  Paint _gridPaint;
  Path _gridPath;

  BezierPainter() {
    _gridPaint = Paint()..style=PaintingStyle.stroke;
    _gridPath = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.color);
    canvas.translate(size.width/2, size.height/2);
    _drawGrid(canvas,size);//绘制格线
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawGrid(Canvas canvas, Size size) {
    _gridPaint
      ..color = Colors.red
      ..strokeWidth = 0.5;
    _gridPath = _buildGridPath(_gridPath, size);
    canvas.drawPath(_buildGridPath(_gridPath, size), _gridPaint);

    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1); //沿y轴镜像
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1); //沿原点镜像
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();

  }

  Path _buildGridPath(Path path, Size size,{step = 20.0}) {
    for (int i = 0; i < size.height / 2 / step; i++) {
      path.moveTo(0, step * i);
      path.relativeLineTo(size.width / 2, 0);
    }
    for (int i = 0; i < size.width / 2 / step; i++) {
      path.moveTo( step * i,0);
      path.relativeLineTo(0,size.height / 2, );
    }
    return path;
  }

}
