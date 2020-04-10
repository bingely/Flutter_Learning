import 'dart:ui';

import 'package:flutter/material.dart';

/// create by 张风捷特烈 on 2020-03-27
/// contact me by email 1981462002@qq.com
/// 说明: 贝塞尔曲线测试画布

class BezierPainter extends CustomPainter {
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
    _drawAxis(canvas, size);//绘制轴线
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void _drawGrid(Canvas canvas, Size size) {
    _gridPaint
      ..color = Colors.grey
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

  void _drawAxis(Canvas canvas, Size size) {
    canvas.drawPoints(PointMode.lines, [
      Offset(-size.width/2, 0) , Offset(size.width/2, 0),
      Offset( 0,-size.height/2) , Offset( 0,size.height/2),
      Offset( 0,size.height/2) , Offset( 0-7.0,size.height/2-10),
      Offset( 0,size.height/2) , Offset( 0+7.0,size.height/2-10),
      Offset(size.width/2, 0) , Offset(size.width/2-10, 7),
      Offset(size.width/2, 0) , Offset(size.width/2-10, -7),
    ], _gridPaint..color=Colors.blue..strokeWidth=1.5);
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
