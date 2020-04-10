import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final List<Color> _hotelColors = [
    Color(0xfffa5956),
    Color(0xfffb8650),
  ];

  final List<Color> _platformColors = [
    Color(0xffffbc49),
    Color(0xffffd252),
  ];

  final List<Color> _flightColors = [
    Color(0xff4b8fed),
    Color(0xff53bced),
  ];

  final List<Color> _travelColors = [
    Color(0xff34c2aa),
    Color(0xff6cd557),
  ];

  final String _hotelBGImageUrl =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel@v7.15.png';
  final String _minsuBGImageUrl =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-minsu@v7.15.png';
  final String _platformBGImage =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-jhj@v7.15.png';
  final String _flightBGImageUrl =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight@v7.15.png';
  final String _trainBGImage =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-train.png';
  final String _tripBGImage =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel@v7.15.png';
  final String _dingzhiBGImage =
      'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-dingzhi@v7.15.png';

  final TextStyle _titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  final TextStyle _platformStyle = TextStyle(
    color: Color(0xffa05416),
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  final BorderSide _borderSide = BorderSide(
    color: Color(0xfff2f2f2),
    width: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _hotelRow(),
        _flightRow(),
        _travelRow(),
      ],
    );
  }

  Widget _hotelRow() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _hotelColors,
            stops: [0, 0.54],
          ),
        ),
        child: Row(
          children: <Widget>[
            _firstBGimageStack(
              imageUrl: _hotelBGImageUrl,
              title: '酒店',
            ),
            _secondBGImageStack(
              imageUrl: _minsuBGImageUrl,
              title: '民宿·客栈',
            ),
            _platformBGImageStack(),
          ],
        ),
      ),
    );
  }

  Widget _flightRow() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: _borderSide,
        ),
        gradient: LinearGradient(colors: _flightColors),
      ),
      height: 65,
      child: Row(
        children: <Widget>[
          _firstBGimageStack(
            imageUrl: _flightBGImageUrl,
            imgWidth: 79,
            title: '飞机',
          ),
          _secondBGImageStack(
            imageUrl: _trainBGImage,
            imgWidth: 37,
            title: '火车票',
          ),
          _noBGImageStack(title: '汽车·船票'),
          _noBGImageStack(title: '专车·租车'),
        ],
      ),
    );
  }

  Widget _travelRow() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _travelColors,
          ),
          border: Border(
            top: _borderSide,
          ),
        ),
        child: Row(
          children: <Widget>[
            _firstBGimageStack(
              imageUrl: _tripBGImage,
              imgWidth: 93,
              title: '旅游',
            ),
            _secondBGImageStack(
              imageUrl: _dingzhiBGImage,
              imgWidth: 61,
              title: '高铁游',
            ),
            _noBGImageStack(title: '邮轮游'),
            _noBGImageStack(title: '定制游'),
          ],
        ),
      ),
    );
  }

  Widget _firstBGimageStack({
    @required String imageUrl,
    double imgWidth = 73,
    String title,
  }) {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            _bgImagePositioned(
              imageUrl,
              width: imgWidth,
            ),
            _firstTitlePositioned(title),
          ],
        ),
      ),
      flex: 31,
    );
  }

  Widget _firstTitlePositioned(String title) {
    return Positioned(
      left: 15,
      top: 25,
      child: Text(
        title,
        style: _titleStyle,
      ),
    );
  }

  Widget _secondBGImageStack({
    @required String imageUrl,
    double imgWidth = 37,
    String title,
  }) {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: _borderSide,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              _bgImagePositioned(
                imageUrl,
                width: imgWidth,
              ),
              _commonTitle(title),
            ],
          ),
        ),
      ),
      flex: 23,
    );
  }

  Widget _noBGImageStack({@required String title}) {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: _borderSide,
            ),
          ),
          child: _commonTitle(title),
        ),
      ),
      flex: 23,
    );
  }

  Widget _commonTitle(String title) {
    return Center(
      child: Text(
        title,
        style: _titleStyle,
      ),
    );
  }

  Widget _platformBGImageStack() {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: _borderSide,
            ),
            gradient: LinearGradient(colors: _platformColors),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              _bgImagePositioned(_platformBGImage, width: 86),
              _platformTitle('机票/火车票+酒店 '),
              _platformTagTilte('方便又便宜'),
            ],
          ),
        ),
      ),
      flex: 46,
    );
  }

  Widget _platformTitle(String title) {
    return Center(
      child: Text(
        title,
        style: _platformStyle,
      ),
    );
  }

  Widget _platformTagTilte(String title) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 32,
          left: 38,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff54c45),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
              bottomRight: Radius.circular(7),
            ),
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bgImagePositioned(String imageUrl, {double width = 73}) {
    return Positioned(
      child: Image.network(
        imageUrl,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
