import 'package:flutter/material.dart';

void main() {
  runApp(const BottomAppBarDemo());
}

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({Key? key}) : super(key: key);

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Bottom App Bar Demo'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: <Widget>[
            /*SwitchListTile(
              title: const Text(
                'Floating Action Button',
              ),
              value: _showFab,
              onChanged: _onShowFabChanged,
            ),
            SwitchListTile(
              title: const Text('Notch'),
              value: _showNotch,
              onChanged: _onShowNotchChanged,
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Floating action button position'),
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Docked - End'),
              value: FloatingActionButtonLocation.endDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Docked - Center'),
              value: FloatingActionButtonLocation.centerDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Floating - End'),
              value: FloatingActionButtonLocation.endFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: const Text('Floating - Center'),
              value: FloatingActionButtonLocation.centerFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),*/
          ],
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          tooltip: 'Create',
        )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {

  //bool _isButtonDisabled =false;

  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {/*_isButtonDisabled=false;*/},
            ),
            /*IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.access_time_filled_rounded,color: Colors.blue),
              onPressed: () {},
            ),*/
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
