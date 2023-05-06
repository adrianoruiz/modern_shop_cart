part of dashboard;

class DashboardController extends GetxController {
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

  Future<List<TrainingModel>> _getTrainingData() async {
    final snapshot = await _firestore.collection('Trainings').get();
    final data = snapshot.docs.map((doc) {
      print("#####");
      final docData = doc.data();
      return TrainingModel(
        id: doc.id,
        title: docData['title'],
        description: docData['description'],
        categories: List<String>.from(docData['categories']),
        author: docData['author'],
        duration: docData['duration'],
        price: docData['price'],
        trailerVid: docData['trailerVid'],
        image: docData['image'],
        tags: List<String>.from(docData['tags']),
        creationDate: docData['creationDate'],
      );
    }).toList();
    print(data);
    return data;
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
