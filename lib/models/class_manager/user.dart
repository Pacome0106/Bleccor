class UserData {
  String name;
  String email;
  String number;
  String photoPath;
  String token;

  UserData({
    required this.name,
    required this.email,
    required this.number,
    required this.photoPath,
    required this.token,
  });

  // Factory method to create a User instance from a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'number': number,
      'photoPath': photoPath,
      'token': token,
    };
  }

  // Method to convert the User instance to a Map
  factory UserData.fromMap(Map<String, dynamic> map){
    return UserData(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      number: map['number'] ?? '',
      photoPath: map['photoPath'] ?? '',
      token: map['token'] ?? '',
    );
  }
}
