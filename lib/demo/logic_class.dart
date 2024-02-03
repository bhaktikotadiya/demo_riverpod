import 'package:flutter/foundation.dart';

class counterprovider extends ChangeNotifier
{
    int counter = 0;
    inc()
    {
          counter++;
          notifyListeners();
    }
    dec()
    {
          counter--;
          notifyListeners();
    }
}