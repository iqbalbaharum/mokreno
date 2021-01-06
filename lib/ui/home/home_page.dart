import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/gen/assets.gen.dart';
import 'package:keretaapp/ui/components/ongoing_service_view.dart';
import 'package:keretaapp/ui/home/home_view_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/ui/loading_state_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  bool _isInForeground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          _isInForeground = true;
        });
        break;
      case AppLifecycleState.paused:
        setState(() {
          _isInForeground = false;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Car Service'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: FutureBuilder(
                builder: (context, snap) {
                  return Text(snap.data);
                },
                future: context.read(homeViewModelProvider).getUsername(),
              ),
              accountEmail: FutureBuilder(
                builder: (context, snap) {
                  return Text(snap.data);
                },
                future: context.read(homeViewModelProvider).getEmail(),
              ),
              currentAccountPicture:
                  Assets.images.letservis.image(height: 160, width: 100),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2.fontSize),
              ),
              leading: Icon(Icons.verified_user),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(Constants.pageProfile);
              },
            ),
            ListTile(
              title: Text(
                'Contact Us',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2.fontSize),
              ),
              leading: Icon(Icons.verified_user),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 64),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xffa52b2a), Color(0xffa52a65)])),
          child: Container(
              child: Column(
            children: [
              ActiveOrder(refresh: this._isInForeground),
              Expanded(child: GridButtonView())
            ],
          )),
        ),
      )),
    );
  }
}

class GridButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          RaisedButton(
              color: Colors.white,
              onPressed: () => Get.toNamed(Constants.pageNewRequest),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 5)),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.images.carservice.image(height: 60, width: 60),
                      SizedBox(height: 10),
                      Text('Make Request')
                    ]),
              )),
        ]);
  }
}

class ActiveOrder extends StatelessWidget {
  final bool refresh;
  List<dynamic> _keys = [];

  ActiveOrder({this.refresh: false});

  @override
  Widget build(BuildContext context) {
    if (refresh) {
      _keys.add(DateTime.now().millisecondsSinceEpoch);
    }

    return HookBuilder(builder: (context) {
      final homeViewModel = context.read(homeViewModelProvider);
      final activeEntity = useProvider(
          homeViewModelProvider.select((value) => value.activeEntity));

      var snapshot;

      snapshot = useFuture(
          useMemoized(() {
            return homeViewModel.getActiveEntity();
          }, _keys),
          preserveState: false);

      if (snapshot.connectionState != ConnectionState.done) return Container();

      return activeEntity.when(
          success: (data) {
            print(data);
            if (data == null) {
              return Container();
            }

            print(data);
            return OngoingServiceView(data);
          },
          failure: (e) => Container());
    });
  }
}
