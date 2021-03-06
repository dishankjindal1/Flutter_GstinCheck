import 'package:flutter/material.dart';
import 'package:gstin_check/view/widgets/slider_button_widget.dart';
import 'package:gstin_check/view_model/gst_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  bool _selectorIndexButtonSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(Icons.view_module),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  color: Colors.green[400],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Search the type for",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      "GST Number Search Tool",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectorIndexButtonSwitch =
                                !_selectorIndexButtonSwitch;
                          });
                        },
                        child: sliderButtonWidget(
                            context, _selectorIndexButtonSwitch)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter GST number',
                            style:
                                TextStyle(fontSize: 24, color: Colors.black54),
                          ),
                        ),
                        ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            color: Colors.black12,
                            child: TextFormField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontSize: 24, color: Colors.green),
                                  hintText: 'Ex 06AFQPJ1959L1ZV',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 16)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<GstViewModel>(context, listen: false)
                                  .getGstDetails(_textEditingController.text);

                              _textEditingController.clear();
                              Navigator.pushNamed(context, '/details');
                            }
                          },
                          child: Center(
                            child: Text(
                              'Search',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                    "Sample code to test...\nActive - 73137\nDisabled - 28738"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
