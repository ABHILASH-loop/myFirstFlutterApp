import 'dart:ffi';

import 'package:flutter/material.dart';
import 'anime_details.dart';

class DisplayLayout extends StatefulWidget {
  late AnimeDetails character;

  DisplayLayout({super.key, required this.character});

  @override
  State<DisplayLayout> createState() => _DisplayLayoutState();
}

class _DisplayLayoutState extends State<DisplayLayout>
    with SingleTickerProviderStateMixin {
  double headingSize = 14.0;
  double subHeadingSize = 18.0;
  late AnimationController _controller;
  late Animation _colorAnimate;
  late Animation _sizeAnimate;
  late CurvedAnimation _curve;
  bool _isFav = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    _curve = CurvedAnimation(
        parent: _controller, curve: Curves.easeOutQuad);

    _colorAnimate = ColorTween(
            begin: Colors.lightBlueAccent.withAlpha(100), end: Colors.redAccent)
        .animate(_curve);

    _sizeAnimate = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(tween: Tween<double>(begin: 32.0, end: 35.0), weight: 54),
        TweenSequenceItem<double>(tween: Tween<double>(begin: 48.0, end: 32.0), weight: 54),
      ]
    ).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isFav = false;
        });
      }
    });
  }

  Widget textLayout(String heading, String body, MainAxisAlignment yAlign,
      CrossAxisAlignment xAlign) {
    return Column(
      mainAxisAlignment: yAlign,
      crossAxisAlignment: xAlign,
      children: [
        Text(
          heading,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: headingSize,
              color: Colors.blueGrey[200],
              letterSpacing: 1),
        ),
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: subHeadingSize,
              color: Colors.amberAccent[100],
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.character.imgUrl,
            width: 500,
            height: 208,
          ),
          const Divider(
            height: 2.0,
            color: Colors.white10,
            thickness: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: textLayout("NAME", widget.character.name,
                        MainAxisAlignment.center, CrossAxisAlignment.center)),
                Flexible(
                    child: textLayout("ORIGIN", widget.character.birthPlace,
                        MainAxisAlignment.center, CrossAxisAlignment.center)),
              ],
            ),
          ),
          Divider(
            height: 20.0,
            color: Colors.lightBlueAccent.shade100,
            thickness: 3.0,
            indent: 32.0,
            endIndent: 32.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 24.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textLayout("SERIES", widget.character.seriesName,
                    MainAxisAlignment.start, CrossAxisAlignment.start),
                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, _) {
                      return Ink(
                        padding: EdgeInsets.all(2.0),
                        decoration: ShapeDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: const CircleBorder(),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _isFav
                                ? _controller.reverse()
                                : _controller.forward();
                          },
                          enableFeedback: false,
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: _colorAnimate.value,
                            size: _sizeAnimate.value,
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: textLayout("ABILITIES", widget.character.ability,
                MainAxisAlignment.start, CrossAxisAlignment.start),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              "STRENGTH",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.blueGrey[200],
                letterSpacing: 1,
              ),
            ),
          ),
          Center(
            child: Text(
              widget.character.strength,
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.amber[300],
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
              child: Text(
                "❝ ${widget.character.quote} ❞",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade50.withAlpha(100),
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
