import 'package:flutter/material.dart';
import '../models/script_model.dart';

class NewScript extends StatefulWidget {
  static const routeNamed = '/newScript';

  @override
  _NewScriptState createState() => _NewScriptState();
}

class _NewScriptState extends State<NewScript> {
  final GlobalKey<FormFieldState> _form = GlobalKey<FormFieldState>();
  TextEditingController _scriptTags = new TextEditingController();

  Script _newScript = Script(
    scriptId: DateTime.now().toIso8601String(),
    isForkable: false,
    isPrivate: false,
    toSponsor: false,
    tags: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Script'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Create Script',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bring your ideas on Flimmer",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  //margin: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    key: _form,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: "Title",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    //controller: _titleController,
                    autocorrect: true,
                    maxLines: 1,
                    validator: (val) {
                      if (val.length == 0) return "Title Can't be null";
                      return null;
                    },
                    onSaved: (newValue) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tags that will define the script'),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _newScript.tags.length,
                          itemBuilder: (context, index) => Chip(
                            label: Text(
                              _newScript.tags[index],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: _scriptTags,
                                decoration: InputDecoration(
                                  hintText: 'Enter Tag',
                                  labelText: 'Tag',
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _newScript.tags.add(_scriptTags.text);
                                  _scriptTags.clear();
                                });
                              },
                              child: Text('ADD TAG'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                  value: _newScript.isPrivate,
                  onChanged: (value) {
                    setState(() {
                      _newScript.isPrivate = value;
                    });
                  },
                  title: Text('Do you wanna make it private ?'),
                ),
                SwitchListTile(
                  value: _newScript.isForkable,
                  onChanged: (value) {
                    setState(() {
                      _newScript.isForkable = value;
                    });
                  },
                  title: Text(
                      'Do you wanna let people make another verion of your script ?'),
                ),
                SwitchListTile(
                  value: _newScript.toSponsor,
                  onChanged: (value) {
                    setState(() {
                      _newScript.toSponsor = value;
                    });
                  },
                  title: Text('Is this script open for funding ?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
