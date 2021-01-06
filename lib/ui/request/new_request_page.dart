import 'package:flutter/material.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/ui/request/new_request_view_model.dart';

class NewRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Request'),
      ),
      body: StepperComponent(),
    );
  }
}

class StepperComponent extends StatefulWidget {
  @override
  _StepperComponentState createState() => _StepperComponentState();
}

class _StepperComponentState extends State<StepperComponent> {
  final nameTEController = TextEditingController();
  final typeTEController = TextEditingController();
  final platNoTEController = TextEditingController();
  final phoneNoTEController = TextEditingController();

  final _contactFormKey = GlobalKey<FormState>();
  final _carFormKey = GlobalKey<FormState>();

  String selectedTransmission = "Auto";

  @override
  Widget build(BuildContext context) {
    final List<CoolStep> steps = [
      CoolStep(
          title: 'Contact Information',
          subtitle: 'Fill in the contact person for pickup.',
          content: Form(
            key: _contactFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameTEController,
                  decoration: InputDecoration(
                      labelText: 'Contact Person',
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(16.0)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextFormField(
                      controller: phoneNoTEController,
                      decoration: InputDecoration(
                          labelText: 'Contact Phone No',
                          contentPadding: EdgeInsets.all(16.0),
                          filled: true,
                          fillColor: Colors.grey[200])),
                ),
              ],
            ),
          ),
          validation: () {
            if (!_contactFormKey.currentState.validate()) {
              return "Fill form correctly";
            }
            return null;
          }),
      CoolStep(
          title: 'Vehicle Information',
          subtitle: 'Provide the requested vehicle collection',
          content: Form(
            key: _carFormKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextFormField(
                      controller: typeTEController,
                      validator: (val) =>
                          val.isEmpty ? 'Insert your vehicle type' : null,
                      decoration: InputDecoration(
                          labelText: 'Type of Vehicle',
                          contentPadding: EdgeInsets.all(16.0),
                          filled: true,
                          fillColor: Colors.grey[200])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextFormField(
                      controller: platNoTEController,
                      validator: (val) => val.isEmpty
                          ? 'Insert your vehicle registration number'
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Vehicle Plat Number',
                          contentPadding: EdgeInsets.all(16.0),
                          filled: true,
                          fillColor: Colors.grey[200])),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0),
                        Text('Transmission Type',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontSize,
                            )),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            _buildSelector(context: context, name: 'Auto'),
                            SizedBox(width: 5.0),
                            _buildSelector(context: context, name: 'Manual')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          validation: () {}),
      CoolStep(
          title: 'Terms of Agreement',
          subtitle: 'Accept the terms below to proceed',
          content: _buildToA(context),
          validation: () {})
    ];

    return CoolStepper(
        onCompleted: () {
          context.read(newRequestViewModelProvider).createEntity(
              nameTEController.text,
              phoneNoTEController.text,
              typeTEController.text,
              platNoTEController.text,
              selectedTransmission);
        },
        steps: steps);
  }

  Widget _buildSelector({
    BuildContext context,
    String name,
  }) {
    bool isActive = name == selectedTransmission;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedTransmission,
          onChanged: (String v) {
            setState(() {
              selectedTransmission = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToA(BuildContext context) {
    return SingleChildScrollView(child: Text(Constants.toA));
  }
}
