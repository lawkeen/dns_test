import 'package:dns_test/data/api.dart';
import 'package:dns_test/data/repository.dart';

import '../model/userModel.dart';

class EnteringPageBloc {
  final user = User();
  final api = Api();
  final rep = Repository();

  Future<String> onTap() async {
    if (user.firstName == null) {
      return ('Нет имени');
    }
    if (user.lastName == null) {
      return ('Нет фамилии');
    }
    if (user.phoneNumber == null && user.phoneNumber.length <= 10) {
      return ('Нет телефона или он ввелден неправильно');
    }
    if (user.email == null) {
      return ('Нет email');
    }
    return await rep.loadToken(user);
  }
}
