import 'package:flutter/material.dart';
import 'package:keretaapp/data/models/entity.dart';
import 'package:keretaapp/gen/assets.gen.dart';

class OngoingServiceView extends StatelessWidget {
  final Entity _activeEntity;

  OngoingServiceView(this._activeEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          Text('ONGOING REQUEST',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Container(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Assets.images.urban, fit: BoxFit.fill)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Text(_activeEntity.metadata.plateno,
                                    style:
                                        Theme.of(context).textTheme.headline3),
                                Text(_activeEntity.metadata.type,
                                    style:
                                        Theme.of(context).textTheme.headline6)
                              ],
                            ),
                          )),
                      Divider(thickness: 1.0, color: Colors.white),
                      Container(
                          padding: EdgeInsets.only(
                              left: 8.0, bottom: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Service Status',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[500]),
                                  ),
                                  Text(
                                    _activeEntity.state.toUpperCase() +
                                        ' (' +
                                        _activeEntity.status.toUpperCase() +
                                        ')',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Last updated',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[500]),
                                  ),
                                  Text(
                                    '17 Dec 2020 6:00 AM',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ))
        ]));
  }
}
