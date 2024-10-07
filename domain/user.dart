class User {
  const User({required this.uid, required this.name, required this.lastname});

  final int uid;
  final String name;
  final String lastname;


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'lastname': lastname,
  };
}