class User {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String githubProfileUrl;
  String summary;

  get toMap => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'githubProfileUrl': githubProfileUrl,
        'summary': summary,
      };
}
