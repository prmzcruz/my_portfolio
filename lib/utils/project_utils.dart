class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/selfcare_image.png',
    title: 'English Learning App',
    subtitle:
        'This is a comprehensive English learning app for practicing and competing with each other.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.eduza',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'English Dictionary App',
    subtitle:
        'This is a dictionary application for English learners to easily look up word definitions.',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.eduza_eng_dictionary',
    iosLink:
        "https://apps.apple.com/us/app/eduza-english-dictionary/id6443770339",
  ),
  ProjectUtils(
      image: 'assets/projects/03.png',
      title: 'Pocket Dictionary',
      subtitle:
          'This is a word memorising app to save and play your own words as quizes',
      androidLink:
          'https://play.google.com/store/apps/details?id=com.shohruhak.eng_pocket_dictionary',
      iosLink:
          'https://apps.apple.com/tr/app/pocket-dictionary-1/id6447465115'),
  ProjectUtils(
    image: 'assets/projects/04.png',
    title: 'Tasbeeh Counter',
    subtitle:
        'This is a simple dzikr counter app for muslims with persistent storage',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.tasbeeh',
  ),
  ProjectUtils(
    image: 'assets/projects/05.png',
    title: 'Todo App',
    subtitle: 'This is a simple task management app with persistent storage',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.todo',
    iosLink: "https://apps.apple.com/us/app/eduza-todo/id6443970333",
  ),
  ProjectUtils(
    image: 'assets/projects/06.png',
    title: 'NotePad App',
    subtitle: 'This is a note taking app for MacOS and Android',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.shohatech.notepad',
    iosLink: 'https://apps.apple.com/us/app/eduza-notepad/id6443973859',
  ),
];

// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/selfcare_image.png',
    title: 'Thinkpeople Selfcare',
    subtitle:
        'A comprehensive HRMS designed for complete employee lifecycle management',
    androidLink:
        'https://play.google.com/store/apps/details?id=com.thinksynq.selfcare_flutter&hl=en_IN',
    iosLink:
        "",
  ),
  ProjectUtils(
    image: 'assets/projects/fieldforce_image.png',
    title: 'Thinkfieldforce',
    subtitle:
        'Stay ahead and plan your activities efficiently with our field force automation app that allows executives to track their plans.',
    androidLink:
    'https://play.google.com/store/apps/details?id=com.thinksynq.thinkfieldforce&hl=en_IN',
    iosLink:
    "",
  ),
  ProjectUtils(
    image: 'assets/projects/lithium_image.png',
    title: 'Lithium',
    subtitle:
        'Lithium is into the business of providing Corporate Employee Transport through electric vehicles',
    androidLink:
    'https://play.google.com/store/apps/details?id=com.thinksynq.lithiumsp&hl=en_IN',
    iosLink:
    "",
  ),
  ProjectUtils(
    image: 'assets/projects/Thinkasset_image.png',
    title: 'ThinkAsset',
    subtitle:
    'ThinksAsset is a comprehensive asset management app designed for businesses to efficiently track, maintain, and audit their assets.',
    androidLink:
    'https://play.google.com/store/apps/details?id=com.thinksynq.snipe_it&hl=en_IN',
    iosLink:
    "",
  ),
  ProjectUtils(
    image: 'assets/projects/thinksupport_image.png',
    title: 'ThinkSupport',
    subtitle:
    'ThinkSupport: Comprehensive Project Management and Issue Tracking Tool',
    androidLink:
    'https://play.google.com/store/apps/details?id=com.ThinkSynq.ThinkSupport&hl=en_IN',
    iosLink:
    "",
  ),
  ProjectUtils(
    image: 'assets/projects/crm_image.png',
    title: 'S&D CRM Application',
    subtitle:
    'The S&D CRM Application– Sales and distribution management tool provides efficient activity management for the Field team. ',
    androidLink:
    'https://play.google.com/store/apps/details?id=tsq.thinksynq.in.hinducrm&hl=en_IN',
    iosLink:
    "",
  ),
];
