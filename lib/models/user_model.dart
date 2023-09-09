class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String accountType;

  User(
      {required this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.accountType});

  Map<String, dynamic> toJson() {
    return {"id": id, "username": username, "first_name": firstName, "last_name": lastName, "email": email, "account_type": accountType};
  }
}
