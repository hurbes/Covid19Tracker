import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covid19tracker/core/viewmodels/start_up_model.dart';
import 'package:covid19tracker/ui/views/country_view.dart';
import 'package:covid19tracker/ui/views/faq_view.dart';
import 'package:covid19tracker/ui/views/most_effected_view.dart';
import 'package:covid19tracker/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'home_view.dart';

class StartUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpModel>.withConsumer(
        viewModel: StartUpModel(),
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) {
         if (!model.busy) {
           if (model.showMainBanner) {
             return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 0,
                title: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30.0),
                    child: Text(
                      "Covid 19 Tracker",
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    )),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 25),
                    child: IconButton(
                        icon: Icon(
                          Icons.lightbulb_outline,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          model.setDarkmode(context: context);
                        }),
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: Theme.of(context).cardColor,
              selectedIndex: model.cIndex,
              onItemSelected: (index) => model.setCIndex(index: index),
              showElevation: false,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Home'),
                  activeColor: Colors.grey,
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.map),
                    title: Text('Stats'),
                    activeColor: Colors.grey),
                BottomNavyBarItem(
                    icon: Icon(Icons.dashboard),
                    title: Text('World Wide'),
                    activeColor: Colors.grey),
                BottomNavyBarItem(
                    icon: Icon(Icons.info_outline),
                    title: Text('Misc.'),
                    activeColor: Colors.grey),
              ],
            ),
            body: IndexedStack(
              index: model.cIndex,
              children: [
                HomeView(),
                MostEffectView(),
                CountryView(),
                FAQView()
              ],
            ),
          );
           } else {
             return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text('Can not communicate with Servers\n\n1. Check you Internet Connection\n\n2. Try Clearing AppData\n\n3. Developer may have shutted down the application', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),),
              ),
            ),
          );
           }
         } else {
           return Scaffold(body: Loading() ,  backgroundColor: Theme.of(context).backgroundColor,);
         }
        });
  }
}
