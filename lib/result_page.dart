import 'package:flutter/material.dart';
import 'package:yasam/constants.dart';
import 'package:yasam/user_data.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                Hesap(_userData).hesaplama().round().toString(),
                textAlign: TextAlign.center,
                style: kMetinStili,
              ),
            ),
            flex: 8,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                child: Text(
                  "Geri Dön",
                  style: kMetinStili,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
