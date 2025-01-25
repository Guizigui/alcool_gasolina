import 'package:flutter/material.dart';

class AppAlcoolGasolina extends StatefulWidget {
  const AppAlcoolGasolina({super.key});

  @override
  State<AppAlcoolGasolina> createState() => _AppAlcoolGasolinaState();
}

class _AppAlcoolGasolinaState extends State<AppAlcoolGasolina> {
  //Controladores dos TextFields
  TextEditingController _gasolina = TextEditingController();
  TextEditingController _alcool = TextEditingController();
  String _textoResultado = "Economize escolhendo o melhor!";

  //Função para calcular
  String? Calculo() {
    double? _precogasolina =
        double.tryParse(_gasolina.text.replaceAll(',', '.'));
    double? _precoAlcool = double.tryParse(_alcool.text.replaceAll(',', '.'));

    if (_precogasolina != null &&
        _precoAlcool != null &&
        _precoAlcool != 0 &&
        _precogasolina != 0) {
      double calculo = _precoAlcool / _precogasolina;

      if (calculo <= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abasteccer com gasolina";
        });
      }
    } else {
      setState(() {
        _textoResultado = "Valor inválido";
      });
    }

    //limparCampos();
  }

  /*void limparCampos(){
    _gasolina.text = "";
    _alcool.text = "";
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFF6DD),
      //Appbar
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Color(0xFFA3C9A8),
        title: Text(
          "Alcool ou Gasolina",
        ),
        titleTextStyle:
            TextStyle(fontFamily: 'Roboto', fontSize: 25, color: Colors.white),
        actions: [Icon(Icons.local_gas_station)],
      ),
      //Estrutura do app
      //SingleChildScrollView(p/ permitir a rolagem de tela)
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //Imagem do app
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/AlcoolGasolinaApp.png',
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Texto p/ alertar retornar a informação ao usuario
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _textoResultado.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            //Primeiro TextField(Gasolina)
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              // Cor da sombra
                              color: Colors.grey.withOpacity(0.5),
                              // Espalhamento
                              spreadRadius: 1,
                              // Suavidade da sombra
                              blurRadius: 5,
                              // Posição da sombra
                              offset: Offset(2, 3),
                            ),
                          ],
                          // Bordas arredondadas
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          //Captura da informação gasolina
                          onSubmitted: (String gasolina) {
                            print("Valor digitado foi: $gasolina");
                          },
                          //Controller
                          controller: _gasolina,

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "",
                            counterText: "",
                            labelText: "Digite o preço da gasolina",
                            border: OutlineInputBorder(),
                            fillColor: Color(0xFFDFF6DD),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          enabled: true,
                          maxLength: 6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Cor de fundo
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            // Cor da sombra
                            spreadRadius: 1,
                            // Espalhamento
                            blurRadius: 5,
                            // Suavidade da sombra
                            offset: Offset(2, 3), // Posição da sombra
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(8), // Bordas arredondadas
                      ),
                      child: TextField(
                        //Captura da informação alcool
                        onSubmitted: (String alcool) {
                          print("O valor digitado foi $alcool");
                        },
                        controller: _alcool,

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          labelText: "Digite o preço do Alcool",
                          border: OutlineInputBorder(),
                          fillColor: Color(0xFFDFF6DD),
                          filled: true,
                          hintText: "",
                          counterText: "",
                        ),
                        enabled: true,
                        maxLength: 6,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Botão
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Calculo();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA3C9A8),
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black87,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
