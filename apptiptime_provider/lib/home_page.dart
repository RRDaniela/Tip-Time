import 'package:apptiptime_provider/selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("App")),
        body: Consumer<SelectedProvider>(builder: (context, provider, _) {
          void _onButtonPressed() {
            String text = _textEditingController.text;
            provider.tipAmountTotal(text);
          }

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      iconTheme: IconThemeData(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter the total cost.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Cost of service',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      prefixIcon: Icon(Icons.store)),
                                  keyboardType: TextInputType.number,
                                  controller: _textEditingController,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8.0, 20, 8, 20),
                            child: Row(
                              children: [
                                Icon(Icons.room_service),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'How was the service?',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Column(
                              children: Provider.of<SelectedProvider>(context)
                                  .options
                                  .entries
                                  .map((option) => RadioListTile(
                                        title: Text(
                                            '${option.key} ${option.value}%'),
                                        value: option.value,
                                        groupValue:
                                            Provider.of<SelectedProvider>(
                                                    context)
                                                .selectedOption,
                                        onChanged: (val) {
                                          Provider.of<SelectedProvider>(context,
                                                  listen: false)
                                              .setSelectedOption = val as int;
                                        },
                                      ))
                                  .toList()),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Icon(Icons.credit_card),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text("Round up tip"),
                                  ],
                                )),
                                Switch(
                                    value: provider.switchValue,
                                    onChanged: (val) {
                                      provider.setswitchValue = val;
                                    })
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 500,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _onButtonPressed();
                                    }
                                  },
                                  child: Text("CALCULATE"))),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Tip amount \$" +
                                    provider.tipAmount.toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
