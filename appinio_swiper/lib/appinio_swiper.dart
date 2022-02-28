import 'dart:math';

import 'package:flutter/material.dart';

class AppinioSwiper extends StatefulWidget {
  /// list of widgets for the swiper
  final List<Widget?>? cards;

  /// controller to trigger unswipe action
  final AppinioSwiperController? controller;

  /// duration of every animation
  final Duration duration;

  /// padding of the swiper
  final EdgeInsetsGeometry padding;

  /// maximum angle the card reaches while swiping
  final double maxAngle;

  /// threshold from which the card is swiped away
  final int threshold;

  /// set to true when swiping should be disabled
  final bool isDisabled;

  /// set to false when unswipe should be disabled
  final bool allowUnswipe;

  /// function that gets called with the new index when the user swiped
  final Function onSwipe;

  /// function that gets called when there is no widget left to be swiped away
  final Function onEnd;

  /// function that gets triggered when the swiper is disabled
  final Function onTapDisabled;

  /// function that gets called with the boolean true when the last card gets unswiped
  final Function unswipe;

  const AppinioSwiper({
    Key? key,
    required this.cards,
    this.controller,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    this.duration = const Duration(milliseconds: 200),
    this.maxAngle = 30,
    this.threshold = 50,
    this.isDisabled = false,
    this.allowUnswipe = true,
    this.onTapDisabled = emptyFunction,
    this.onSwipe = emptyFunctionIndexString,
    this.onEnd = emptyFunction,
    this.unswipe = emptyFunctionBool,
  })  : assert(maxAngle >= 0 && maxAngle <= 360),
        assert(threshold >= 1 && threshold <= 100),
        super(key: key);

  @override
  State createState() => _AppinioSwiperState();
}

class _AppinioSwiperState extends State<AppinioSwiper>
    with SingleTickerProviderStateMixin {
  double _left = 0;
  double _top = 0;
  double _total = 0;
  double _angle = 0;
  double _maxAngle = 0;
  double _scale = 0.9;
  double _difference = 40;

  int _swipeTyp = 0; // 1 = swipe, 2 = unswipe, 3 = goBack
  bool _tapOnTop = false; //position of starting drag point on card

  late AnimationController _animationController;
  late Animation<double> _leftAnimation;
  late Animation<double> _topAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _differenceAnimation;
  late Animation<double> _unSwipeLeftAnimation;
  late Animation<double> _unSwipeTopAnimation;

  bool _vertical = false;
  bool _horizontal = false;
  int _swipedDirectionVertical = 0; //-1 bottom, 1 top
  int _swipedDirectionHorizontal = 0; //-1 left, 1 right

  Widget? _lastCard;

  @override
  void initState() {
    super.initState();

    //unswipe widget from the outside
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (widget.controller!.state == AppinioSwiperState.unswipe) {
          if (_lastCard != null) {
            if (widget.allowUnswipe) {
              widget.unswipe(true);
              _unSwipe();
              _animationController.forward();
            }
          }
        }
        if (widget.cards!.length != 0) {
          if (widget.controller!.state == AppinioSwiperState.swipeRight) {
            _left = widget.threshold + 1;
            _swipeHorizontal(context);
            _animationController.forward();
          }
          if (widget.controller!.state == AppinioSwiperState.swipeLeft) {
            _left = -widget.threshold - 1;
            _swipeHorizontal(context);
            _animationController.forward();
          }
          if (widget.controller!.state == AppinioSwiperState.swipeUp) {
            _top = -widget.threshold - 1;
            _swipeVertical(context);
            _animationController.forward();
          }
          if (widget.controller!.state == AppinioSwiperState.swipeDown) {
            _top = widget.threshold + 1;
            _swipeVertical(context);
            _animationController.forward();
          }
        }
      });
    }

    if (widget.maxAngle > 0) {
      _maxAngle = widget.maxAngle * (pi / 180);
    }

    _animationController =
        AnimationController(duration: widget.duration, vsync: this);
    _animationController.addListener(() {
      //when value of controller changes
      if (_animationController.status == AnimationStatus.forward) {
        setState(() {
          if (_swipeTyp != 2) {
            _left = _leftAnimation.value;
            _top = _topAnimation.value;
          }
          if (_swipeTyp == 2) {
            _left = _unSwipeLeftAnimation.value;
            _top = _unSwipeTopAnimation.value;
          }
          _scale = _scaleAnimation.value;
          _difference = _differenceAnimation.value;
        });
      }
    });

    _animationController.addStatusListener((status) {
      //when status of controller changes
      if (status == AnimationStatus.completed) {
        setState(() {
          if (_swipeTyp == 1) {
            _lastCard = widget.cards!.last;
            widget.cards!.removeLast();
            String direction;
            if (_horizontal) {
              (_swipedDirectionHorizontal == 1)
                  ? direction = 'right'
                  : direction = 'left';
            } else {
              (_swipedDirectionVertical == 1)
                  ? direction = 'top'
                  : direction = 'bottom';
            }

            widget.onSwipe(widget.cards!.length, direction);
            if (widget.cards!.isEmpty) widget.onEnd();
          } else if (_swipeTyp == 2) {
            _lastCard = null;
          }
          _animationController.reset();
          _left = 0;
          _top = 0;
          _total = 0;
          _angle = 0;
          _scale = 0.9;
          _difference = 40;
          _swipeTyp = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: widget.padding,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    ...widget.cards!
                        .asMap()
                        .map((index, _) {
                          return MapEntry(
                            index,
                            _item(constraints, index),
                          );
                        })
                        .values
                        .toList(),
                  ]);
            },
          ),
        );
      },
    );
  }

  Widget _item(BoxConstraints constraints, int index) {
    if (index != widget.cards!.length - 1) {
      return Visibility(
        visible: widget.cards!.length - index <= 2,
        child: Positioned(
          top: _difference,
          left: 0,
          child: Container(
            color: Colors.transparent,
            child: Transform.scale(
              scale: _scale,
              child: Container(
                constraints: constraints,
                child: widget.cards![index],
              ),
            ),
          ),
        ),
      );
    }

    //swipe is disabled
    if (widget.isDisabled == true) {
      return Positioned(
        left: _left,
        top: _top,
        child: Stack(
          children: [
            Container(
              constraints: constraints,
              child: widget.cards![index],
            ),
            GestureDetector(
              //transparent container
              onTap: () {
                widget.onTapDisabled();
              },
              child: Container(
                constraints: constraints,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      );
    }

    return Positioned(
      left: _left,
      top: _top,
      child: GestureDetector(
        child: Transform.rotate(
          angle: _angle,
          child: Container(
            constraints: constraints,
            child: widget.cards![index],
          ),
        ),
        onPanStart: (tapInfo) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset position = renderBox.globalToLocal(tapInfo.globalPosition);
          if (position.dy < renderBox.size.height / 2) _tapOnTop = true;
        },
        onPanUpdate: (tapInfo) {
          setState(() {
            _left += tapInfo.delta.dx;
            _top += tapInfo.delta.dy;
            _total = _left + _top;
            _calculateAngle();
            _calculateScale();
            _calculateDifference();
          });
        },
        onPanEnd: (tapInfo) {
          _tapOnTop = false;
          _onEndAnimation();
          _animationController.forward();
        },
      ),
    );
  }

  void _calculateAngle() {
    if (_angle <= _maxAngle && _angle >= -_maxAngle) {
      (_tapOnTop == true)
          ? _angle = (_maxAngle / 100) * (_left / 10)
          : _angle = (_maxAngle / 100) * (_left / 10) * -1;
    }
  }

  void _calculateScale() {
    if (_scale <= 1.0 && _scale >= 0.9) {
      _scale =
          (_total > 0) ? 0.9 + (_total / 5000) : 0.9 + -1 * (_total / 5000);
    }
  }

  void _calculateDifference() {
    if (_difference >= 0 && _difference <= _difference) {
      _difference = (_total > 0) ? 40 - (_total / 10) : 40 + (_total / 10);
    }
  }

  void _onEndAnimation() {
    if (_left < -widget.threshold || _left > widget.threshold) {
      _swipeHorizontal(context);
    } else if (_top < -widget.threshold || _top > widget.threshold) {
      _swipeVertical(context);
    } else {
      _goBack(context);
    }
  }

  //moves the card away to the left or right
  void _swipeHorizontal(BuildContext context) {
    setState(() {
      _swipeTyp = 1;
      _leftAnimation = Tween<double>(
        begin: _left,
        end: (_left > widget.threshold)
            ? MediaQuery.of(context).size.width
            : -MediaQuery.of(context).size.width,
      ).animate(_animationController);
      _topAnimation = Tween<double>(
        begin: _top,
        end: _top + _top,
      ).animate(_animationController);
      _scaleAnimation = Tween<double>(
        begin: _scale,
        end: 1.0,
      ).animate(_animationController);
      _differenceAnimation = Tween<double>(
        begin: _difference,
        end: 0,
      ).animate(_animationController);
    });
    (_left > widget.threshold)
        ? _swipedDirectionHorizontal = 1
        : _swipedDirectionHorizontal = -1;
    (_top <= 0) ? _swipedDirectionVertical = 1 : _swipedDirectionVertical = -1;
    _horizontal = true;
  }

  //moves the card away to the top or bottom
  void _swipeVertical(BuildContext context) {
    setState(() {
      _swipeTyp = 1;
      _leftAnimation = Tween<double>(
        begin: _left,
        end: _left + _left,
      ).animate(_animationController);
      _topAnimation = Tween<double>(
        begin: _top,
        end: (_top > widget.threshold)
            ? MediaQuery.of(context).size.height
            : -MediaQuery.of(context).size.height,
      ).animate(_animationController);
      _scaleAnimation = Tween<double>(
        begin: _scale,
        end: 1.0,
      ).animate(_animationController);
      _differenceAnimation = Tween<double>(
        begin: _difference,
        end: 0,
      ).animate(_animationController);
    });
    (_top < widget.threshold)
        ? _swipedDirectionVertical = 1
        : _swipedDirectionVertical = -1;
    (_left >= 0)
        ? _swipedDirectionHorizontal = 1
        : _swipedDirectionHorizontal = -1;
    _vertical = true;
  }

  //moves the card back to starting position
  void _goBack(BuildContext context) {
    setState(() {
      _swipeTyp = 3;
      _leftAnimation = Tween<double>(
        begin: _left,
        end: 0,
      ).animate(_animationController);
      _topAnimation = Tween<double>(
        begin: _top,
        end: 0,
      ).animate(_animationController);
      _scaleAnimation = Tween<double>(
        begin: _scale,
        end: 0.9,
      ).animate(_animationController);
      _differenceAnimation = Tween<double>(
        begin: _difference,
        end: 40,
      ).animate(_animationController);
    });
  }

  //unswipe the card: brings back the last card that was swiped away
  void _unSwipe() {
    if (_lastCard != null) {
      widget.cards!.add(_lastCard);
      _swipeTyp = 2;
      //unSwipe horizontal
      if (_horizontal == true) {
        _unSwipeLeftAnimation = Tween<double>(
          begin: (_swipedDirectionHorizontal == 1)
              ? MediaQuery.of(context).size.width
              : -MediaQuery.of(context).size.width,
          end: 0,
        ).animate(_animationController);
        _unSwipeTopAnimation = Tween<double>(
          begin: (_swipedDirectionVertical == 1)
              ? -MediaQuery.of(context).size.height / 4
              : MediaQuery.of(context).size.height / 4,
          end: 0,
        ).animate(_animationController);
        _scaleAnimation = Tween<double>(
          begin: 1.0,
          end: _scale,
        ).animate(_animationController);
        _differenceAnimation = Tween<double>(
          begin: 0,
          end: _difference,
        ).animate(_animationController);
      }
      //unSwipe vertical
      if (_vertical == true) {
        _unSwipeLeftAnimation = Tween<double>(
          begin: (_swipedDirectionHorizontal == 1)
              ? MediaQuery.of(context).size.width / 4
              : -MediaQuery.of(context).size.width / 4,
          end: 0,
        ).animate(_animationController);
        _unSwipeTopAnimation = Tween<double>(
          begin: (_swipedDirectionVertical == 1)
              ? -MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height,
          end: 0,
        ).animate(_animationController);
        _scaleAnimation = Tween<double>(
          begin: 1.0,
          end: _scale,
        ).animate(_animationController);
        _differenceAnimation = Tween<double>(
          begin: 0,
          end: _difference,
        ).animate(_animationController);
      }
      _swipedDirectionHorizontal = 0;
      _swipedDirectionVertical = 0;
      _vertical = false;
      _horizontal = false;

      setState(() {});
    }
  }
}

//for null safety
void emptyFunction() {}
void emptyFunctionIndexString(int index, String direction) {}
void emptyFunctionBool(bool unswiped) {}
void emptyFuntionString(String direction) {}

//to call the unswipe function from outside of the appinio swiper
class AppinioSwiperController extends ChangeNotifier {
  AppinioSwiperState? state;

  //calls unswipe the card by changing the status of the controller
  void unswipe() {
    state = AppinioSwiperState.unswipe;
    notifyListeners();
  }

  void swipeRight() {
    state = AppinioSwiperState.swipeRight;
    notifyListeners();
  }

  void swipeLeft() {
    state = AppinioSwiperState.swipeLeft;
    notifyListeners();
  }

  void swipeUp() {
    state = AppinioSwiperState.swipeUp;
    notifyListeners();
  }

  void swipeDown() {
    state = AppinioSwiperState.swipeDown;
    notifyListeners();
  }
}

enum AppinioSwiperState { unswipe, swipeLeft, swipeRight, swipeUp, swipeDown }
