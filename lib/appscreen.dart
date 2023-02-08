import 'package:flutter/material.dart';
import 'package:login_register_ui/login_screen.dart';
import 'package:rive/rive.dart';





class MainSrc extends StatefulWidget  {
  const MainSrc({super.key});


  @override
  State<StatefulWidget> createState() => _MainSrcState();
}

class _MainSrcState extends State<MainSrc>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _kTabPages = <Widget>[
  Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
  Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),

  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    Tab(icon: Icon(Icons.forum), text: 'Tab3'),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6E2EA),
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: Colors.purple,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xffD6E2EA),

    );
  }


class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<StatefulWidget> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("FlexibleSpace title"),
              background: Image.asset(
                'res/images/material_design_3.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          const SliverFillRemaining(
            child: Center(child: Text("Hello")),
          ),
        ],
      ),
      bottomNavigationBar: _getBottomAppBar(),
    );
  }

  Widget _getBottomAppBar() {
    return BottomAppBar(
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text('pinned'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    _pinned = val;
                  });
                },
                value: _pinned,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Text('snap'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    _snap = val;
                    // **Snapping only applies when the app bar is floating.**
                    _floating = _floating || val;
                  });
                },
                value: _snap,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Text('floating'),
              Switch(
                onChanged: (bool val) {
                  setState(() {
                    _floating = val;
                    if (_snap == true) {
                      if (_floating != true) {
                        _snap = false;
                      }
                    }
                  });
                },
                value: _floating,
              ),
            ],
          ),
        ],
      ),
    );
  }
}



