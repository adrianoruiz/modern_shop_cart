part of training;

class TrainingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrainingDetailsController());
  }
}
