
import 'package:covid19tracker/core/models/StaticData.dart';
import 'package:flutter/material.dart';

class FAQView extends StatelessWidget {
  const FAQView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: ListView.builder(
          itemCount: StaticData.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                StaticData.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold , 
                fontFamily: "OpenSans",),
              ),
              children: <Widget>[
                Padding(
                   padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Text(StaticData.questionAnswers[index]['answer'] , style: TextStyle(fontFamily: "OpenSans",),),
                )
              ],
            );
          }),),
    );
  }
}
