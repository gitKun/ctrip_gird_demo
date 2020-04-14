import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:ctrip_gird_demo/sub_nav/sub_nav_sprites_image.dart';

class SubNavWidget extends StatefulWidget {
  @override
  SubNavWidgetWidgetState createState() => SubNavWidgetWidgetState();
}

class SubNavWidgetWidgetState extends State<SubNavWidget> {
  ui.Image _img;

  @override
  void initState() {
    super.initState();
    _loadSubNavImageByProvider(
      AssetImage('images/un_ico_subnav.png'),
    );
  }

  @override
  void dispose() {
    _img.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_img != null) {
      return Column(
        children: <Widget>[
          _rowItemContent(0, _img),
          _rowItemContent(1, _img),
        ],
      );
    } else {
      return Container(
        height: 110,
      );
//      return FutureBuilder<ui.Image>(
//        future: _loadSubNavImageByProvider(
//          AssetImage('images/un_ico_subnav.png'),
//        ),
//        builder: (context, snapshot) {
//          return Column(
//            children: <Widget>[
//              _rowItemContent(0, snapshot.data),
//              _rowItemContent(1, snapshot.data),
//            ],
//          );
//        },
//      );
    }
  }

  final List<String> _names = [
    '自由行',
    'Wifi电话本',
    '保险·签证',
    '换钞·购物',
    '当地向导',
    '特价机票',
    '礼品卡',
    '申卡·借钱',
    '旅拍',
    '更多',
  ];

  final int _rowItemsNum = 5;

  _loadSubNavImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    debugPrint('load local image!');
    Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
    ImageStreamListener listener;
    ImageStream stream = provider.resolve(config); //获取图片流
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //监听
      final ui.Image image = frame.image;
      setState(() {
        _img = frame.image;
      });
      completer.complete(image); //完成
      stream.removeListener(listener); //移除监听
    });
    stream.addListener(listener); //添加监听
  }

  /*
  Future<ui.Image> _loadSubNavImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    debugPrint('load local image!');
    Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
    ImageStreamListener listener;
    ImageStream stream = provider.resolve(config); //获取图片流
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //监听
      final ui.Image image = frame.image;
      setState(() {
        _img = frame.image;
      });
      completer.complete(image); //完成
      stream.removeListener(listener); //移除监听
    });
    stream.addListener(listener); //添加监听
    return completer.future;
  }
   */

  Widget _itemWidget(index, ui.Image img) {
    return Expanded(
      child: Container(
        height: 55,
        child: Column(
          children: <Widget>[
            SubNavSpritesImage(
              showIndex: index,
              img: img,
            ),
            Text(
              _names[index],
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
      flex: 1,
    );
  }

  List<Widget> _rowContentList(int rowIdx, ui.Image img) {
    return List<int>.generate(_rowItemsNum, (i) => i + rowIdx * _rowItemsNum)
        .map((idx) {
      return _itemWidget(idx, img);
    }).toList();
  }

  Widget _rowItemContent(int rowIdx, ui.Image img) {
    if ((rowIdx + 1) * _rowItemsNum > _names.length) {
      return null;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _rowContentList(rowIdx, img),
    );
  }
}
