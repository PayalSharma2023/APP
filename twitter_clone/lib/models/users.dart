// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FirebaseUser {
  final String email;
  final String name;
  final String ProfilePic;

  const FirebaseUser({
    required this.email,
    required this.name,
    required this.ProfilePic,
  });

  FirebaseUser copyWith({
    String? email, String? name, String? ProfilePic,
  }) {
    return FirebaseUser(
      email: email ?? this.email, 
      name: name ?? this.name, 
      ProfilePic: ProfilePic ?? this.ProfilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'ProfilePic': ProfilePic,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '', 
      name: map['name']?? '', 
      ProfilePic: map['ProfilePic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) => FirebaseUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FirebaseUser(email: $email)';

  @override
  bool operator ==(covariant FirebaseUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
