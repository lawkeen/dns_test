import 'package:dns_test/data/repository.dart';
import 'package:dns_test/model/userModel.dart';
import 'package:rxdart/rxdart.dart';

enum LoadingState { loading, loaded, init }

class SecondPageBloc {
  final loadingSubject = BehaviorSubject<LoadingState>();

  _init() {
    loadingSubject.sink.add(LoadingState.init);
  }

  SecondPageBloc(this.user) {
    _init();
  }

  final User user;
  final _rep = Repository();

  get watchLoading => loadingSubject.stream;

  Future<String> onTap() async {
    if (user.firstName == null) {
      return ('Нет имени');
    }
    if (user.lastName == null) {
      return ('Нет фамилии');
    }
    if (user.phoneNumber == null && user.phoneNumber.length >= 10) {
      return ('Нет телефона или он ввелден неправильно');
    }
    if (user.email == null) {
      return ('Нет email');
    }
    if (user.githubProfileUrl == null) {
      return ('Нет githubUrl');
    }
    if (user.summary == null) {
      return ('Нет резюме');
    }
    loadingSubject.sink.add(LoadingState.loading);
    var res = await _rep.register(user);
    loadingSubject.sink.add(LoadingState.loaded);
    return res;
  }

  dispose() {
    loadingSubject.close();
  }
}
