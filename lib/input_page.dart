import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam/IconCinsiyet.dart';
import 'package:yasam/MyContainer.dart';
import 'package:yasam/constants.dart';
import 'package:yasam/result_page.dart';
import 'package:yasam/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "";
  double icilenSigara = 30.0;
  double gidilenGym = 3.5;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    Row buildRowOutlineButton(int sayi, String yazi) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              yazi,
              style: kMetinStili,
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text("$sayi", style: kSayiStili),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.blue),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    yazi == "Boy" ? boy++ : kilo++;
                  });
                },
                child: Text('+'),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.blue),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    yazi == "Boy" ? boy-- : kilo--;
                  });
                },
                child: Text('-'),
              ),
            ],
          ),
        ],
      );
    }

    ;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton(boy, "Boy"),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton(kilo, "Kilo"),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Haftalık Kaç Gün Spor Yapıyorsun?", style: kMetinStili),
                  Text(gidilenGym.round().toString(), style: kSayiStili),
                  Slider(
                    activeColor: Colors.black,
                    min: 0,
                    max: 7,
                    value: gidilenGym,
                    onChanged: (double gym) {
                      setState(() {
                        gidilenGym = gym;
                      });
                    },
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Günde Kaç Sigara içiyorsunuz ", style: kMetinStili),
                  Text(icilenSigara.round().toString(), style: kSayiStili),
                  Slider(
                    activeColor: Colors.black,
                    min: 0,
                    max: 60,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == "KADIN"
                        ? Color.fromARGB(255, 71, 128, 155)
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: "Kadın",
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Color.fromARGB(255, 71, 128, 155)
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: "Erkek",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(50, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        UserData(
                            kilo: kilo,
                            boy: boy,
                            icilenSigara: icilenSigara,
                            seciliCinsiyet: seciliCinsiyet,
                            gidilenGym: gidilenGym),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Hesapla',
                  style: kMetinStili,
                )),
          ),
        ],
      ),
    );
  }
}
