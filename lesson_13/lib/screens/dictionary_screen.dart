import 'package:flutter/material.dart';
import 'package:lesson_13/db/DbWord.dart';
import 'package:lesson_13/models/words.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  List<Words> words = [];
  var db = DatabaseWord.instance;
  String query = "";
  bool favourite = false;

  @override
  void initState() {
    super.initState();
    super.initState();
    db.getWords(query).then((value) {
      setState(() {
        words.clear();
        words.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary"),
        actions: [
          IconButton(
            icon: Icon(
              favourite ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              if (!favourite) {
                db.getFavouriteWords(query).then((value) {
                  setState(() {
                    words.clear();
                    words.addAll(value);
                  });
                });
                setState(() {
                  favourite = true;
                });
              } else {
                db.getWords(query).then((value) {
                  setState(() {
                    words.clear();
                    words.addAll(value);
                  });
                });
                setState(() {
                  favourite = false;
                });
              }
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                onChanged: (newText) {
                  onTextChanged(newText);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'search...',
                  suffix: Icon(
                    Icons.search,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: words.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(16),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            "${words[index].word}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              db
                                  .setFavourite(Words(
                                id: words[index].id,
                                word: words[index].word,
                                favourite: words[index].favourite == 0 ? 1 : 0,
                              ))
                                  .then((value) {
                                setState(
                                  () {
                                    words[index].favourite == 0
                                        ? words[index].favourite = 1
                                        : words[index].favourite = 0;
                                  },
                                );
                              });
                            },
                            child: Icon(
                              words[index].favourite == 0
                                  ? Icons.star_border
                                  : Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onTextChanged(String newText) {
    print(newText);
    query = newText;
    if (favourite) {
      db.getFavouriteWords(newText).then((value) {
        setState(() {
          words.clear();
          words.addAll(value);
        });
      });
    } else {
      db.getWords(newText).then((value) {
        setState(() {
          words.clear();
          words.addAll(value);
        });
      });
    }
  }
}
