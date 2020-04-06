

import 'package:covid19tracker/ui/widgets/countrylist.dart';
import 'package:flutter/material.dart';

Widget countryView(){
  return Container(
    color: Colors.grey.withOpacity(0.1),
    child: Padding(
       padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
       child: CountryList(),),
  );
}