import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _recentSearchedText = 'Recent searches';
  EdgeInsets _recentSearchedPadding = new EdgeInsets.fromLTRB(15, 15, 0, 10);

  List<String> products = ['tshirt', 'bluetooth earphone', 'bluetooth speaker', 'fhm magazine', 'lisa poster', 'kids clothes', 'xiaomi phone'];
  List<String> recentSearched = ['earphones', 'twice merchs'];
  List<String> suggestionList = ['earphones', 'twice merchs'];

  onInputChanged(String value){
    setState(() {
      if (value.isEmpty){
        _recentSearchedText = 'Recent searches';
        _recentSearchedPadding = new EdgeInsets.fromLTRB(15, 15, 0, 10);
      }
      else{
        _recentSearchedText = '';
        _recentSearchedPadding = new EdgeInsets.fromLTRB(0, 0, 0, 0);
      }
      suggestionList = value.isEmpty
        ? recentSearched
        : products.where((p) => p.toLowerCase().contains(value.toLowerCase())).toList(); //startsWith(input)).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
                          controller: _inputController,
                          onChanged: onInputChanged,
                          decoration: InputDecoration(
                            hintText: 'Search product',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, size: 20),
                              color: Colors.grey,
                              onPressed: (){
                                setState(() {
                                  _inputController.text = '';
                                });
                              },
                            ),
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(30.0)
                            )
                          )
                        ),
                      ),
                    ),
                ], 
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: _recentSearchedPadding,
                child: Text(_recentSearchedText, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: ListView(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  children: suggestionList.map((data) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.5, color: Colors.grey[200])                          
                          )
                        ),
                        child: ListTile(
                          title: Text(data),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/searchresult');
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