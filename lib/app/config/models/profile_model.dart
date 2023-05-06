class ProfileModel {
  // final ImageProvider photo;
  final String name;
  final String email;
  final int? inBasket;
  final List<String>? trainings;

  const ProfileModel({
    // required this.photo,
    required this.name,
    required this.email,
    this.inBasket,
    this.trainings,
  });
}
