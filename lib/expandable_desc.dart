import 'package:flutter/material.dart';

class ExpandableDesc extends StatefulWidget{
  final String desc;

  const ExpandableDesc({super.key,required this.desc});
    @override
  State<StatefulWidget> createState() => _ExpandableDesc();
}

class _ExpandableDesc extends State<ExpandableDesc>{

   bool _isExpanded = false;
   
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text(widget.desc,maxLines: _isExpanded?null:1,overflow: _isExpanded?null:TextOverflow.ellipsis,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [OutlinedButton(onPressed:(){setState(() {
           _isExpanded= !_isExpanded;
        });}, child: Text(_isExpanded?"Show less":"Show more"))],
        )
      ],
    );
    
  }
}