import 'package:dns_test/data/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/userModel.dart';

enum LoadingState { loading, loaded, init }

class EnteringPageBloc {
  final loadingSubject = BehaviorSubject<LoadingState>();

  _init() {
    loadingSubject.sink.add(LoadingState.init);
  }

  EnteringPageBloc() {
    _init();
  }

  get watchLoading => loadingSubject.stream;

  final user = User();
  final _rep = Repository();

  Future<String> onTap() async {
    if (user.firstName == null) {
      return ('Нет имени');
    }
    if (user.lastName == null) {
      return ('Нет фамилии');
    }
    if (user.phoneNumber == null && user.phoneNumber.length <= 10) {
      return ('Нет телефона или он введен неправильно');
    }
    if (user.email == null) {
      return ('Нет email');
    }
    loadingSubject.sink.add(LoadingState.loading);
    var res = await _rep.loadToken(user);
    loadingSubject.sink.add(LoadingState.loaded);
    return res;
  }

  dispose() {
    loadingSubject.close();
  }
}
