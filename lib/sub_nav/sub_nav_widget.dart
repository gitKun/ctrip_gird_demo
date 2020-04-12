import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:ctrip_gird_demo/sub_nav/sub_nav_sprites_image.dart';

class SubNavWidget extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: _loadSubNavImageByProvider(
        AssetImage('images/un_ico_subnav.png'),
      ),
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            _rowItemContent(0, snapshot.data),
            _rowItemContent(1, snapshot.data),
          ],
        );
      },
    );
  }

  Future<ui.Image> _loadSubNavImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    debugPrint('load local image!');
    Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
    ImageStreamListener listener;
    ImageStream stream = provider.resolve(config); //获取图片流
    listener = ImageStreamListener(
      (ImageInfo frame, bool sync) {
        //监听
        final ui.Image image = frame.image;
        completer.complete(image); //完成
        stream.removeListener(listener); //移除监听
      },
      // node: ignore `onError` and `onChunk`.
    );
    stream.addListener(listener); //添加监听
    return completer.future;
  }

  Widget _nomalItemExpanded(index, ui.Image img) {
    return Expanded(
      child: _itemContainer(index, img),
      flex: 1,
    );
  }

  Widget _itemExpandedWithNew(index, ui.Image img) {
    return Expanded(
      flex: 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _itemContainer(index, img),
          _newTagText(),
        ],
      ),
    );
  }

  Widget _newTagText() {
    return Positioned(
      top: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xfff94242), Color(0xffffa25f)]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'NEW',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget _itemContainer(index, ui.Image img) {
    return Container(
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
    );
  }

  List<Widget> _rowContentList(int rowIdx, ui.Image img) {
    return List<int>.generate(_rowItemsNum, (i) => i + rowIdx * _rowItemsNum)
        .map((idx) {
      if (idx == 8) {
        return _itemExpandedWithNew(idx, img);
      }
      return _nomalItemExpanded(idx, img);
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
