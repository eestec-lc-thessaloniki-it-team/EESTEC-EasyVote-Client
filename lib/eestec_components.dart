import 'package:eestec_voting/voteissue.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'expandabletext.dart';

class EVotingCard extends StatelessWidget {
  final VoteIssue voteIssue;

  const EVotingCard({Key key, @required this.voteIssue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 17, 20, 17),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 15),
                blurRadius: 15,
              ),
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, -10), blurRadius: 15)
            ]),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      this.voteIssue.title,
                      style: TextStyle(fontFamily: "Poppins-Bold", fontSize: 22),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: DescriptionTextWidget(text: this.voteIssue.description, wordCount: 140)
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {},
                        padding: EdgeInsets.all(10),
                        color: Color(0XFFEB2426),
                        child: Text("Vote",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class EFloatingActionButton extends StatelessWidget {
  const EFloatingActionButton({
    Key key,
    @required List<IconData> handRules,
    @required AnimationController handRulesController,
    @required this.fabKey,
  }) : _handRules = handRules, _handRulesController = handRulesController, super(key: key);

  final List<IconData> _handRules;
  final AnimationController _handRulesController;
  final GlobalKey<ScaffoldState> fabKey;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_handRules.length, (int index) {
          var child = Container(
            height: 70,
            width: 56,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _handRulesController,
                  curve: Interval(0.0, 1.0 - index / _handRules.length / 2.0,
                      curve: Curves.easeOut)),
              child: FloatingActionButton(
                heroTag: null,
                backgroundColor: Color(0XFFEB2426),
                mini: true,
                child: Icon(
                  _handRules[index],
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {
                  String message;
                  print(index);
                  switch (index) {
                    case 0:
                      message = "You made a technical";
                      break;
                    case 1:
                      message = "You made a correction";
                      break;
                    case 2:
                      message = "You made another thing";
                      break;
                    default:
                      break;
                  }
                  fabKey.currentState.showSnackBar(SnackBar(
                    content: Text(message),
                    duration: Duration(milliseconds: 600),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {},
                    ),
                  ));
                },
              ),
            ),
          );
          return child;
        }).toList()
          ..add(Container(
            child: FloatingActionButton(
              backgroundColor: Color(0XFFEB2426),
              heroTag: null,
              child: AnimatedBuilder(
                animation: _handRulesController,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    transform: Matrix4.rotationZ(
                        _handRulesController.value * 0.5 * math.pi),
                    alignment: FractionalOffset.center,
                    child:
                     Icon(_handRulesController.isDismissed
                        ? Icons.share
                        : Icons.close),
                  );
                },
              ),
              onPressed: () {
                if (_handRulesController.isDismissed) {
                  _handRulesController.forward();
                } else {
                  _handRulesController.reverse();
                }
              },
            ),
          )));
  }
}

