import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'home_screen.dart';

class CardNoteView extends StatefulWidget {
  final int captureIndex;
  const CardNoteView({Key? key, required this.captureIndex}) : super(key: key);

  @override
  State<CardNoteView> createState() => _CardNoteViewState();
}

class _CardNoteViewState extends State<CardNoteView> {
  // reference the box
  final _referToBoxForEdit=Hive.box('notesBox');
  // text editing controller
  final captureUpdatedNotes=TextEditingController();
  String _updateNotes='';

  void updateNewNotes(){
    setState(() {
      _referToBoxForEdit.putAt(widget.captureIndex, _updateNotes);
      captureUpdatedNotes.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
    });
  }
  //delete data
  void deleteNote() {
    _referToBoxForEdit.deleteAt(widget.captureIndex);
    captureUpdatedNotes.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontFamily: 'Merriweather Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: const Color(0xFFF4EEE0),
                    ),
                  ),
                  Text(
                    'Note',
                    style: TextStyle(
                      fontFamily: 'Merriweather Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: const Color(0xFFF4EEE0),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(1, -1),
                    child: IconButton(onPressed: deleteNote, icon: const Icon(Icons.delete,
                      color: const Color(0xFFF4EEE0),
                    ),
                    ),
                  ),
                  TextField(
                    cursorColor: const Color(0xFFF4EEE0),
                    style: TextStyle(
                      color: const Color(0xFFF4EEE0),
                    ),
                    controller: TextEditingController(text: _referToBoxForEdit.getAt(widget.captureIndex)),
                    decoration: InputDecoration(
                      labelText: 'Edit note',
                      labelStyle: TextStyle(
                        color: const Color(0xFFF4EEE0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            //width: 3.0,
                            color: const Color(0xFFF4EEE0),
                          )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              //width: 3.0,
                              color: const Color(0xFFF4EEE0),
                            ))
                    ),
                    maxLines: 20,
                    minLines: 1,
                    onChanged: (text){
                      _updateNotes=text;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: (){Navigator.pop(context);}, child: const Text('Cancel',
                        style: TextStyle(color: const Color(0xFFF4EEE0)),
                      )

                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: updateNewNotes, child: const Text('Save',
                        style: TextStyle(color: const Color(0xFFF4EEE0)),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
