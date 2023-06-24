import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.blue,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: Text('Charts'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 30,
              left: 225,
              child: Image.asset('assets/purple.jpg'),
            ),
              Positioned(
                bottom: 180,
                left: 350,
              child: RaisedButton(
                onPressed: () {},
                child: Text('COUNTRY & CITY CHARTS',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
              )),
              ),
            Positioned(
                bottom: 140,
                left: 350,
                child: Text(
                  'FROM AROUND THE WORLD',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
                )),
            Positioned(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),
                  children: <Widget>[
                    ProductBox(
                      title: "India Chart",
                      img1: 'Honey.jpg',
                      nm1: 'Honey',
                      ar1: 'Kehlani',
                      img2: 'gdd.jpg',
                      nm2: 'Go Down Deh',
                      ar2: 'Spice ft. Sean Paul & Shaggy',
                      img3: 'sm.jpg',
                      nm3: 'Slow Motion',
                      ar3: 'AMARIA BB'
                    ),
                    ProductBox(
                        title: "Discovery: India",
                       img1: 'sm.jpg',
                        nm1: 'Slow Motion',
                        ar1: 'AMARIA BB',
                        img2: 'pa.jpg',
                        nm2: 'Pasoori Acoustic',
                        ar2: 'Uday Biswas',
                        img3: 'hope.jpg',
                        nm3: 'Hope',
                        ar3: 'Crookst',
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.title, this.img1, this.nm1, this.ar1, this.img2, this.nm2, this.ar2, this.img3, this.nm3, this.ar3}) :
    super(key: key);
    final String title;
    final String img1;
    final String nm1;
    final String ar1;
    final String img2;
    final String nm2;
    final String ar2;
    final String img3;
    final String nm3;
    final String ar3;

  Widget build(BuildContext context)   {
    return Container(
      padding: EdgeInsets.all(2),
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(this.title, style: TextStyle(
                fontWeight: FontWeight.bold
            )
            ),
            Image.asset("assets/" + img1),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.nm1), Text(this.ar1)
                        ]
                    ),
                )),
            Image.asset("assets/" + img2),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.nm2), Text(this.ar2)
                      ]
                  ),
                )),
            Image.asset("assets/" + img3),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.nm3), Text(this.ar3)
                      ]
                  ),
                )),
            Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30)
          ],
        ),
      ),
    );
  }
}
