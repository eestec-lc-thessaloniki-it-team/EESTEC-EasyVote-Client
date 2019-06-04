import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';


class DescriptionTextWidget extends StatefulWidget {

  final String text;
  final int wordCount;

  DescriptionTextWidget({@required this.text, @required this.wordCount});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();

}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {

  String firstHalf;
  String secondHalf;

  var flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > widget.wordCount) {
      firstHalf = widget.text.substring(0, widget.wordCount);
      secondHalf = widget.text.substring(widget.wordCount, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? RichText(text: TextSpan(text: firstHalf,),textAlign: TextAlign.justify,)
          : InkWell(child: Column(
            children: <Widget>[
              RichText(text: TextSpan(text: flag 
              ? (firstHalf + "...") 
              : (firstHalf + secondHalf), style: TextStyle(fontSize: 14, color: Colors.black),),textAlign: TextAlign.justify,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Text(flag ? "Show More" : "Show Less",
                    style:  TextStyle(color: Colors.grey),
                 )
             ],)
            ],
          ),
          onTap: () {
            setState(() {
             flag = !flag; 
            });
          },)
    );
  }
}