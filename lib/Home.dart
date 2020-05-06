import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaItens = [
    "Oi",
    "tudo",
    "bem",
    "com",
    "voce"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _listaItens.length,
            itemBuilder: (context, indice){
            final item = _listaItens[indice];
            
            return Dismissible(
              background: Container(
                color: Colors.green,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                        Icons.edit,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
                secondaryBackground: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                direction: DismissDirection.horizontal, //por padrao o desmiss é horizontal para ambos lados
                onDismissed: (direction){

                if(direction == DismissDirection.endToStart){
                  print("fim: " + direction.toString());

                }else if (direction == DismissDirection.startToEnd){
                  print("Começo: " + direction.toString());

                }

                setState(() {
                  _listaItens.removeAt(indice);

                });
                },
                key: Key(item),
                child: ListTile(
                  title: Text(_listaItens[indice].toString()),
                  onTap: (){},
                )
            );
            }
        ),
      ),
    );
  }
}
