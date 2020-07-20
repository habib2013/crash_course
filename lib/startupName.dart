import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  int currentIndex;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final _saved = Set<WordPair>();
  final _suggestion = <WordPair>[];
  final textFonts = TextStyle(fontSize: 20);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list) ,onPressed: _pushSaved )
        ],
      ),
      body: _SuggestionBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),


              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),


    );
  }



  void _pushSaved(){
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context){
              final tiles = _saved.map(
                      (WordPair pair) {
                    return ListTile(
                      title: Text(pair.asPascalCase),

                    );
                  }
              );
              final divided = ListTile.divideTiles(tiles: tiles,context:  context).toList();

              return Scaffold(
                appBar: AppBar(title:Text('SavedSuggestion') ,),
                body: ListView(children: divided,),
              );
            }
        )
    );


  }

  Widget _SuggestionBuilder(){
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context,i){
          if(i.isOdd) return Divider();

          final index = i~/2;
          if(index >= _suggestion.length){
            _suggestion.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestion[index]);

        });

  }
  Widget _buildRow(WordPair pair){
    final _alreadysaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase,style: textFonts,),
      trailing: Icon(
        _alreadysaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadysaved ? Colors.red: null,
      ),
      onTap: (){
        setState(() {
          _alreadysaved ? _saved.remove(pair) : _saved.add(pair);
        });

      },

    );
  }

}

