part of training;

class TrainingDetailsController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  // Data
  Future<ProfileModel> _getProfile() async {
    // Get a reference to the profiles collection
    CollectionReference profiles =
        FirebaseFirestore.instance.collection('profiles');

    // Retrieve the profile document
    QuerySnapshot snapshot = await profiles.get();

    // Get the first (and only) document in the snapshot
    DocumentSnapshot profileDoc = snapshot.docs[0];

    print("##### ${profileDoc.get("name")}");
    print("##### ${profileDoc.get("email")}");
    print("##### ${profileDoc.get("inBasket.trainings")}");

    return ProfileModel(
        // photo: AssetImage(ImageRasterPath.avatar1),
        name: profileDoc.get("name"),
        email: profileDoc.get("email"),
        trainings: profileDoc.get('inBasket.trainings'));

    // return const ProfileModel(
    //     // photo: AssetImage(ImageRasterPath.avatar1),
    //     name: "Spartaz",
    //     email: "flutterwithgia@gmail.com",
    //     trainings: ["", "", "", "", "", ""]);
  }

  // _addTrainingToBasket(price, id) async {
  //   // Get a reference to the profiles collection
  //   CollectionReference profiles =
  //       FirebaseFirestore.instance.collection('profiles');

  //   // Update the document based on the provided ID
  //   DocumentReference documentRef = profiles.doc("JGCRmxK2Jy3mEruvktsr");

  //   // Retrieve the existing document snapshot
  //   DocumentSnapshot snapshot = await documentRef.get();

  //   if (snapshot.exists) {
  //     // Get the current values of totalPrice and trainings from the snapshot
  //     double currentTotalPrice = snapshot.get('inBasket.totalPrice');
  //     List<dynamic> currentTrainings = snapshot.get('inBasket.trainings');

  //     // Update the totalPrice and trainings array with the new values
  //     double updatedTotalPrice = currentTotalPrice + price;
  //     List<dynamic> updatedTrainings = List.from(currentTrainings)..add(id);

  //     // Update the document with the new values
  //     await documentRef.update({
  //       'inBasket.totalPrice': updatedTotalPrice,
  //       'inBasket.trainings': updatedTrainings,
  //     });
  //   }
  // }

  TrainingModel _getTrainingDetails() {
    final arguments = Get.arguments;
    final TrainingModel training = (arguments == null)
        ? TrainingModel(
            id: "id",
            title: "title",
            description: "description",
            categories: ["categories"],
            author: "author",
            duration: "duration",
            price: 0.0,
            trailerVid: "trailerVid",
            image: "image",
            creationDate: Timestamp(100, 999))
        : arguments['trainingData'];
    return training;
  }

  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      percent: .3,
      projectImage: const AssetImage(ImageRasterPath.logo1),
      projectName: "Marketplace Mobile",
      releaseTime: DateTime.now(),
    );
  }

  List<ProjectCardData> getActiveProject() {
    return [
      ProjectCardData(
        percent: .3,
        projectImage: const AssetImage(ImageRasterPath.logo2),
        projectName: "Taxi Online",
        releaseTime: DateTime.now().add(const Duration(days: 130)),
      ),
      ProjectCardData(
        percent: .5,
        projectImage: const AssetImage(ImageRasterPath.logo3),
        projectName: "E-Movies Mobile",
        releaseTime: DateTime.now().add(const Duration(days: 140)),
      ),
      ProjectCardData(
        percent: .8,
        projectImage: const AssetImage(ImageRasterPath.logo4),
        projectName: "Video Converter App",
        releaseTime: DateTime.now().add(const Duration(days: 100)),
      ),
    ];
  }

  List<ImageProvider> getMember() {
    return const [
      AssetImage(ImageRasterPath.avatar1),
      AssetImage(ImageRasterPath.avatar2),
      AssetImage(ImageRasterPath.avatar3),
      AssetImage(ImageRasterPath.avatar4),
      AssetImage(ImageRasterPath.avatar5),
      AssetImage(ImageRasterPath.avatar6),
    ];
  }

  List<ChattingCardData> getChatting() {
    return const [
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar6),
        isOnline: true,
        name: "Samantha",
        lastMessage: "i added my new tasks",
        isRead: false,
        totalUnread: 100,
      ),
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar3),
        isOnline: false,
        name: "John",
        lastMessage: "well done john",
        isRead: true,
        totalUnread: 0,
      ),
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar4),
        isOnline: true,
        name: "Alexander Purwoto",
        lastMessage: "we'll have a meeting at 9AM",
        isRead: false,
        totalUnread: 1,
      ),
    ];
  }
}
