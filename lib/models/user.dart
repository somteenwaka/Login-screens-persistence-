class User {
  final String firstName;
  final String lastName;
  var password;
  final String email;
  final int id;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.password,
      required this.id});
}
