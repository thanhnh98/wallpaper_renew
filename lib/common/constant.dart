
import 'package:wallpaper/model/album_cover.dart';

class Constant{
  static int _width = 400;
  static int _height = 600;
  static int _perpage = 30;
  static List<AlbumCoverModel> getListTopicLanding() => [
    // HorizontalLandingItemModel(
    //     S.current.landing_title_tet,
    //     "https://images.pexels.com/photos/6156621/pexels-photo-6156621.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
    //     "https://api.pexels.com/v1/search?query=${"Tết"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.curated",
        "https://images.pexels.com/photos/7473029/pexels-photo-7473029.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/${"curated"}?per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.animal",
        "https://images.pexels.com/photos/87403/cheetah-leopard-animal-big-87403.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"animal"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.nature",
        "https://images.pexels.com/photos/2365457/pexels-photo-2365457.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"motor"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.motor_bike",
        "https://images.pexels.com/photos/4513031/pexels-photo-4513031.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"motorcycle"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.text",
        "https://images.pexels.com/photos/261763/pexels-photo-261763.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"text"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.travel",
        "https://images.pexels.com/photos/1051075/pexels-photo-1051075.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"travel"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.traffic",
        "https://images.pexels.com/photos/7674/pexels-photo.jpg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"traffic"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.mobile",
        "https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"mobile"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.random",
        "https://images.pexels.com/photos/572741/pexels-photo-572741.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"country"}&per_page=$_perpage"),
  ];

  static List<AlbumCoverModel> getListTopicSuggestSearchPage() => [
    AlbumCoverModel(
        "S.current.curated",
        "https://images.pexels.com/photos/5914065/pexels-photo-5914065.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/${"curated"}?per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.animal",
        "https://images.pexels.com/photos/41315/africa-african-animal-cat-41315.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"animal"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.nature",
        "https://images.pexels.com/photos/33041/antelope-canyon-lower-canyon-arizona.jpg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"nature"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.school",
        "https://images.pexels.com/photos/2681319/pexels-photo-2681319.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"high+school"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.text",
        "https://images.pexels.com/photos/261763/pexels-photo-261763.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"text"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.travel",
        "https://images.pexels.com/photos/1051075/pexels-photo-1051075.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"travel"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.traffic",
        "https://images.pexels.com/photos/7674/pexels-photo.jpg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"traffic"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.mobile",
        "https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"mobile"}&per_page=$_perpage"),
    AlbumCoverModel(
        "S.current.random",
        "https://images.pexels.com/photos/572741/pexels-photo-572741.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=$_height&w=$_width",
        "https://api.pexels.com/v1/search?query=${"country"}&per_page=$_perpage"),
  ];

  static List<String> listKeyWord() => [
    "Korea",
    "animal",
    "sea",
    "business",
    "fine art",
    "flower",
    "sky",
    "nature",
    "medical",
    "hospital",
    "girl",
    "man",
    "boy",
    "robot",
    "math",
    "macbook",
    "world-travel",
    "sport",
    "industry",
    "teacher",
    "student",
    "father",
    "family",
    "vietnamese",
    "japan",
    "american",
    "world",
    "mommy",
    "android",
    "robotic",
    "fishing",
    "shark",
    "phone",
    "plant",
    "people",
    "monkey",
    "cat",
    "pretty",
    "illustration",
    "lifestyle",
    "city"
  ];


  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print("DATA ----> ${data}");
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print("NOTIFICATION ----> ${notification}");

    }

    // Or do other work.
  }
}