import 'package:yasam/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  num hesaplama() {
    num sonuc;

    sonuc = 75 + _userData.gidilenGym - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    return _userData.seciliCinsiyet == 'KADIN' ? sonuc + 3 : sonuc - 3;
  }
}
