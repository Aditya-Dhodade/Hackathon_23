import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'keysprivate_state.dart';

class KeysprivateCubit extends Cubit<KeysprivateState> {
  KeysprivateCubit() : super(KeysprivateInitial());
  late int c;
  List<String> pk = [
    "e0658ba6085776e683a80d5ea36eb91460bf6d74d72aaed4e402c9a7b2881891",
    "03d15abf8574c5bebc3b96851bb6c7654e966e15857afa666f37a638c2887bd4",
  ];
  late String uID;
  init() {
    c = -1;
  }

  void userAdded(String id) {
    c++;
    uID = id;
  }

  String getPrivateKey() {
    return pk[c];
  }
}
