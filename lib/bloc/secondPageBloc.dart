import 'package:dns_test/data/api.dart';
import 'package:dns_test/data/repository.dart';
import 'package:dns_test/model/userModel.dart';

class SecondPageBloc {
  SecondPageBloc(this.user);

  final User user;
  final api = Api();
  final rep = Repository();

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
    return await rep.register(user);
  }
}
