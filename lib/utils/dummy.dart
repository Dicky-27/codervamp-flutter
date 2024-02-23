import 'package:codervamp/utils/assets.dart';

class Dummy {
  static List<Map<String, String>> menus = [
    {
      'emoji': '🏨',
      'title': 'Hotels',
    },
    {
      'emoji': '🏝️',
      'title': 'Holiday',
    },
    {
      'emoji': '🚕',
      'title': 'Taxi',
    },
    {
      'emoji': '🎫',
      'title': 'Ticket',
    },
    {
      'emoji': '🛫',
      'title': 'Airplane',
    },
    {
      'emoji': '🛳️',
      'title': 'Harbour',
    },
  ];

  static List<Map<String, String>> destinations = [
    {
      'imgPath': Assets.IMG_NUSA,
      'title': "Nusa Penida",
      "location": "Nusapenida, Bali",
    },
    {
      'imgPath': Assets.IMG_TANAH,
      'title': "Tanah Lot",
      "location": "Tabanan, Bali",
    },
    {
      'imgPath': Assets.IMG_BEDUGUL,
      'title': "Bedugul",
      "location": "Bedugul, Bali",
    },
    {
      'imgPath': Assets.IMG_BULELENG,
      'title': "Buleleng",
      "location": "Buleleng, Bali",
    },
    {
      'imgPath': Assets.IMG_KARANGASEM,
      'title': "Karangasem",
      "location": "Karangasem, Bali",
    },
    {
      'imgPath': Assets.IMG_KUTA,
      'title': "Kuta",
      "location": "Kuta, Bali",
    },
  ];

  static List<Map<String, String>> stories = [
    {'name': 'Debra', 'image': Assets.IMG_PROFILE_1},
    {'name': 'Leslie', 'image': Assets.IMG_SONG},
    {'name': 'Ann', 'image': Assets.IMG_TANAH},
    {'name': 'John', 'image': Assets.IMG_NUSA},
    {'name': 'Budi', 'image': Assets.IMG_DESK},
    {'name': 'Ray', 'image': Assets.IMG_KARANGASEM},
    {'name': 'Fey', 'image': Assets.IMG_KUTA},
  ];

  static List<Map<String, String>> posts = [
    {
      "name": "Debra",
      "profileImage": Assets.IMG_PROFILE_1,
      "image": Assets.IMG_BULELENG,
      "likes": "24,002",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "name": "John",
      "profileImage": Assets.IMG_NUSA,
      "image": Assets.IMG_NUSA,
      "likes": "4,002",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      "name": "Ray",
      "profileImage": Assets.IMG_KARANGASEM,
      "image": Assets.IMG_KUTA,
      "likes": "24,002",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
  ];
}
