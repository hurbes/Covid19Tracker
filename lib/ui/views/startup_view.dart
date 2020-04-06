import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covid19tracker/core/viewmodels/base_model.dart';
import 'package:covid19tracker/ui/views/country_view.dart';
import 'package:covid19tracker/ui/views/faq_view.dart';
import 'package:covid19tracker/ui/views/most_effected_view.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'home_view.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({Key key}) : super(key: key);

  @override
  _StartUpPageState createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BaseModel>.withConsumer(
        viewModel: BaseModel(),
        builder: (context, model, child) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  elevation: 0,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8.0 , top: 30.0),
                    child: Text(
                      "Covid-19 Tracker",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0 , top: 25),
                      child: IconButton(
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            model.about();
                          }),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() => _currentIndex = index);
                  _pageController.jumpToPage(index);
                },
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
              body: PageView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: <Widget>[
                  HomeView(),
                  MostEffectView(),
                  countryView(),
                  FAQView()
                ],
              ));
        });
  }
}
