import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class _SpritesPainter extends CustomPainter {
  final ui.Image _img; // 图片
  Paint mainPaint;

  int _showIndex = 0;

  _SpritesPainter(
    this._img, {
    @required int showIndex,
  }) {
    this._showIndex = showIndex;
    mainPaint = Paint();
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    Rect rect = Offset(0, 0) & size;
    // 裁剪绘制区域
    canvas.clipRect(rect);
    if (_img != null) {
      double showSize = _img.width.toDouble();
      Rect src = Rect.fromLTRB(
        0,
        _showIndex * showSize,
        showSize,
        (_showIndex + 1) * showSize,
      );
      // src: _img将要显示的区域, rect: _img将要显示的区域实际被绘制的区域
      canvas.drawImageRect(_img, src, rect, mainPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is _SpritesPainter) {
      _SpritesPainter oldPainter = oldDelegate;
      if (oldPainter._showIndex != this._showIndex ||
          oldPainter.mainPaint != this.mainPaint) {
        return true;
      }
    }
    return false;
  }
}

class SubNavSpritesImage extends StatefulWidget {
  final int showIndex;
  final ui.Image img;

  SubNavSpritesImage({
    Key key,
    @required this.showIndex,
    @required this.img,
  }) : super(key: key);

  @override
  _SubNavSpritesImageState createState() => _SubNavSpritesImageState();
}

class _SubNavSpritesImageState extends State<SubNavSpritesImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      child: CustomPaint(
        painter: _SpritesPainter(
          widget.img,
          showIndex: widget.showIndex,
        ),
      ),
    );
  }
}
