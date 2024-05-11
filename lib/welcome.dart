import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 100),
                      child: Image.asset(
                        'assets/carrito_compras.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Bienvenido',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,top: 60.0, right: 16.0),  // Asegura el espacio desde el AppBar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,  // Alineación vertical de los elementos
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Tiendas locales al alcance \nde tu mano',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 20.0,right: 16.0),  // Espacio entre los dos textos
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Vivamus molestie sit amet \njusto eget luctus.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,  // Color del texto
                  fontSize: 14,  // Tamaño del texto
                  fontWeight: FontWeight.normal,  // Peso normal del texto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
