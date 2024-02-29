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

  static List<Map<String, dynamic>> nftsCollections = [
    {
      "image": Assets.IMG_COLL_1,
      "title": "Gorillax Club",
      "nfts": 1,
      "subtitle": "Collection, Art",
      "price": "10343.31",
      "percent": "+241.29%",
      "isIncrease": true
    },
    {
      "image": Assets.IMG_COLL_2,
      "title": "Ugly Cats",
      "nfts": 2,
      "subtitle": "Collection, Art",
      "price": "10443.1",
      "percent": "-21.29%",
      "isIncrease": false
    },
    {
      "image": Assets.IMG_COLL_3,
      "title": "Zombies",
      "nfts": 3,
      "subtitle": "Collection, Art",
      "price": "10143.31",
      "percent": "-11.29%",
      "isIncrease": false
    }
  ];

  static List<Map<String, dynamic>> nfts = [
    {
      "title": "Sonic #23",
      "category": "ART",
      "price": "\$1.23",
      "image": Assets.IMG_NFT_1
    },
    {
      "title": "Decentr.e #102",
      "category": "ART",
      "price": "\$1.23",
      "image": Assets.IMG_NFT_2
    },
    {
      "title": "Airplane #21",
      "category": "ART",
      "price": "\$1.23",
      "image": Assets.IMG_NFT_3
    },
    {
      "title": "Nft #27",
      "category": "ART",
      "price": "\$1.23",
      "image": Assets.IMG_NFT_4
    }
  ];
}
