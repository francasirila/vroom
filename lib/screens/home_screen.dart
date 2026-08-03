import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState(){
    return _HomeScreenState();
  }
 }



class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _tabtitle = 'Home';


  final List<Widget> _tabs = [_HomeTab(), _OrdersTab(),ProfileTab()];
  final List<String> _titles = ['Home','Orders','Profile'];

void onTabClicked (int index){
  setState((){
    _selectedIndex = index;
    _tabtitle = _titles[index];
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tabtitle)),
      body: IndexedStack(index: _selectedIndex, children: _tabs,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTabClicked,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: "orders"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "profile",
          ),
        ]
      )
    );
  }
}




class _HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}




class _OrdersTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Orders'),
    );
  }
}


class ProfileTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile'),
    );
  }
}