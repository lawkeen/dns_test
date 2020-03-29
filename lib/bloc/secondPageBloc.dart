import 'package:dns_test/data/api.dart';
import 'package:dns_test/data/repository.dart';
import 'package:dns_test/model/userModel.dart';

class SecondPageBloc {
  final user = User();

  Future<String> onTap() async {
    final user = User();
    final api = Api();
    final rep = Repository();
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
