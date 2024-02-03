import 'package:demo_riverpod/demo/logic_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Counterclass = ChangeNotifierProvider((ref) => counterprovider());
final testString = Provider((ref) => "Hello !");