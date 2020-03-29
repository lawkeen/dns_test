class Data {
  static String firstName;
  static String secondName;
  static String email;
  static String phoneNumber;
  static String githubProfileUrl;
  static String summary;

  static get toMap => {
        'firstName': firstName,
        'secondName': secondName,
        'email': email,
        'phoneNumber': phoneNumber,
        'githubProfileUrl': githubProfileUrl,
        'summary': summary,
      };
}
