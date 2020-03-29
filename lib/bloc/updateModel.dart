import '../pages/EnteringPage.dart';
import '../pages/secondPage.dart';
import '../model/dataModel.dart';

class DataBloc {
  static void update() {
    Data.firstName = EnteringPageState.firstNameFieldController.text;
    Data.secondName = EnteringPageState.secondNameFieldController.text;
    Data.email = EnteringPageState.emailFieldController.text;
    Data.phoneNumber = EnteringPageState.phoneNumberFieldController.text;
    Data.githubProfileUrl = SecondScreen.gitFieldController.text;
    Data.summary = SecondScreen.summaryFieldController.text;
  }
}
