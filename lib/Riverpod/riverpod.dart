import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goosegrid/Models/riverpod_model.dart';

final goosegridState = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel();
});
