import 'anime_details.dart';
import 'dart:math';

class RandomAnime {
  static final List<AnimeDetails> characters = [
    AnimeDetails(
        "Goku",
        "Dragon Ball",
        "Planet Vegeta",
        "Ki blasts and transformation abilities",
        "https://images5.alphacoders.com/904/904443.png",
        "9000",
        "Power comes in response to a need, not a desire. You have to create that need."),
    AnimeDetails(
        "Naruto Uzumaki",
        "Naruto",
        "Hidden Leaf Village, Land of Fire",
        "Ninja jutsu and chakra control",
        "https://wallpaperaccess.com/full/407169.png",
        "80",
        "I'm not gonna run away, I never go back on my word! That's my nindo: my ninja way!"),
    AnimeDetails(
        "Monkey D. Luffy",
        "One Piece",
        "Dawn Island, East Blue Sea",
        "Rubber body and various fighting techniques",
        "https://images.hdqwalls.com/download/pirate-monkey-d-luffy-from-one-piece-5k-za-1280x1024.jpg",
        "200",
        "The only time you should ever look back, is to see how far you've come."),
    AnimeDetails(
        "Ichigo Kurosaki",
        "Bleach",
        "Karakura Town, Japan",
        "Soul Reaper abilities and Zanpakuto sword techniques",
        "https://w0.peakpx.com/wallpaper/402/657/HD-wallpaper-ichigo-kurosaki-shikai-bleach.jpg",
        "90",
        "It's not a question of can or can't. There are some things in life you just do."),
    AnimeDetails(
        "Edward Elric",
        "Fullmetal Alchemist",
        "Resembool, Amestris",
        "Alchemy and transmutation abilities",
        "https://images3.alphacoders.com/278/278485.jpg",
        "70",
        "A lesson without pain is meaningless. That's because no one can gain without sacrificing something.")
  ];

  final Random random = Random();

  AnimeDetails getAnime() {
    return characters[random.nextInt(characters.length)];
  }
}
