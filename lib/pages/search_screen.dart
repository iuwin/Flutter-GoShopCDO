import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String recentSearchedText = 'Recent';
  EdgeInsets recentSearchedPadding = new EdgeInsets.fromLTRB(15, 15, 0, 10);
  Icon _searchBarSuffixIcon = new Icon(Icons.mic, size: 20);

  List<String> products = ['tshirt', 'bluetooth earphone', 'bluetooth speaker', 'fhm magazine', 'lisa poster', 'kids clothes', 'xiaomi phone'];
  List<String> recentSearched = ['earphones', 'twice merchs'];
  List<String> suggestionList = ['earphones', 'twice merchs'];


  onInputChanged(String value){
    setState(() {
      if (value.isEmpty){
        recentSearchedText = 'Recent';
        recentSearchedPadding = new EdgeInsets.fromLTRB(15, 15, 0, 10);
        _searchBarSuffixIcon = new Icon(Icons.mic, size: 20);
      }
      else{
        recentSearchedText = '';
        recentSearchedPadding = new EdgeInsets.fromLTRB(0, 0, 0, 0);
        _searchBarSuffixIcon = new Icon(Icons.clear, size: 20);
      }
      suggestionList = value.isEmpty
        ? recentSearched
        : products.where((p) => p.toLowerCase().contains(value.toLowerCase())).toList(); //startsWith(input)).toList();
    });
  }


  Widget searchBar() => Container(
    height: 70,//MediaQuery.of(context).size.height * .15,
    decoration: BoxDecoration(
      color: Color(0xFFB308278),//Colors.grey[200],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 20),
            color: Colors.white,
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ),
          Form(
            key: _formKey,
            child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * .82,
            child:TextFormField(
                controller: inputController,
                onChanged: onInputChanged,
                decoration: InputDecoration(
                  hintText: 'Search product',
                  suffixIcon: IconButton(
                    icon: _searchBarSuffixIcon,
                    color: Colors.grey,
                    onPressed: (){
                      setState(() {
                        inputController.text = '';
                      });
                    },
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    //borderRadius: BorderRadius.circular(30.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                    //borderRadius: BorderRadius.circular(30.0)
                  )
                )
              ),
            ),
          ),
      ], 
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            searchBar(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: recentSearchedPadding,
                child: Text(recentSearchedText, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: ListView(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  children: suggestionList.map((data) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border(
                          //   bottom: BorderSide(width: 1.5, color: Colors.grey[200])         
                          // ),
                        ),
                        child: ListTile(
                          title: Text(data),
                          onTap: (){
                            Navigator.pushNamed(context, '/searchresult');
                          },
                        ),
                    );
                  }
                ).toList(),
              )
            )
          ],
        ),
      ),
    );
  }
}