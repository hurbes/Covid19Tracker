

import 'package:covid19tracker/ui/widgets/countrylist.dart';
import 'package:flutter/material.dart';

class CountryView extends StatefulWidget {
  CountryView({Key key}) : super(key: key);

  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> with AutomaticKeepAliveClientMixin<CountryView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
    color: Colors.grey.withOpacity(0.1),
    child: Padding(
       padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
       child: CountryList(),),
  );
  }

  @override
  bool get wantKeepAlive => true;
}