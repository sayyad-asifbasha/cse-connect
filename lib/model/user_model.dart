class UserModel {
  final String uid;
  final String email;
  final String? name;
  String? phoneNumber;
  String? gender;
  String? imageURL;
   String? FCS_TOKEN ;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.phoneNumber,
    this.gender,
    this.imageURL,
    this.FCS_TOKEN,
  });

  // From JSON method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] ?? 'user',
      phoneNumber: json['phoneNumber'] ?? 'not provided',
      gender: json['gender'] ?? '',
      imageURL: json['imageURL'] ?? '',
      FCS_TOKEN: json['FCS_TOKEN'] as String,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'imageURL': imageURL,
      'FCS_TOKEN':FCS_TOKEN
    };
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, name: $name, phoneNumber: $phoneNumber, gender: $gender, imageURL: $imageURL,FCS_TOKEN:$FCS_TOKEN)';
  }
}