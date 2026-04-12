class OnboardingModel {
  final String image;
  final String title;
  final String supTitle;

  OnboardingModel({required this.image, required this.title, required this.supTitle});

  static List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: 'assets/images/Onboarding_1.png',
      title: 'Order Food Around You',
      supTitle: 'When you oder, we’ll hook you up with exclusive coupon, specials and rewards',
    ),
    OnboardingModel(
      image: 'assets/images/Onboarding_2.png',
      title: 'Receive the Great Food',
      supTitle:
          'You’ll receive the great food within a hour. And get free delivery credits for every order.',
    ),
    OnboardingModel(
      image: 'assets/images/Onboarding_3.png',
      title: 'Hot Delivery to Home',
      supTitle: 'We make food ordering fasr, simple and free-no matter if you order online or cash',
    ),
  ];
}
