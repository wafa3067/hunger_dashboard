import 'package:flutter/material.dart';


class HungerCard extends StatefulWidget {
  var image;
  var date;
  var videos;
  var descriptions;
  var link;
  var title_color;
  var desc_color;
  var main_color;
  var image_width;
  var image_height;
  var image_fit;
  HungerCard({Key? key,  this.descriptions,
    this.image,
    this.date,
    this.videos,
    this.link,
    this.title_color,
    this.desc_color,
    this.main_color,
    this.image_width,
    this.image_height,
    this.image_fit,}) : super(key: key);

  @override
  State<HungerCard> createState() => _HungerCardState();
}

class _HungerCardState extends State<HungerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      widget.image != null
          ? Container(
        padding: EdgeInsets.only(bottom: 20),
        color: Colors.white,
        height: widget.image_height==null ? 200 :widget.image_height,
        width: widget.image_width==null ?
        MediaQuery.of(context).size.width:widget.image_width,
        child: Image.network(widget.image,fit: widget.image_fit==null ? BoxFit.cover:widget.image_fit,),
      )
          : Container(),
      widget.link != null
          ? InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            widget.link,
            style: TextStyle(color: Colors.amber),
          ),
        ),
      )
          : Container(),
      widget.date != null
          ? Container(
        padding: EdgeInsets.all(5),
        child: Text(
          widget.date,
          style: TextStyle(
              color: widget.title_color == null
                  ? Colors.white
                  : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      )
          : Container(),
      SizedBox(
        height: 10,
      ),
      widget.descriptions != null
          ? Container(
        padding: EdgeInsets.all(5),
        child: Text(
          widget.descriptions,
          style: TextStyle(
              color: widget.desc_color == null
                  ? Colors.white
                  : Colors.black,
              fontSize: 16),
        ),
      )
          : Container(),
      SizedBox(
        height: 10,
      ),
    ],),);
  }
}
