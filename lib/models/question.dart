import 'option.dart';

class Question {
  final int id;
  final String text;
  final List<Option> options;
  bool ? isLocked;
  Option ? selectedOption;

  Question({
    required this.id,
    required this.text,
    required this.options,
    this.isLocked=false,
    this.selectedOption,
  });
}

List<Question> questions=[

  Question(
    id: 1,
    text: "İklimi nasıl olan bir yere seyehat etmek istersiniz?" ,
  options: [
      Option(tag: 'hot', text: 'Sıcak'),
      Option(tag: 'cool', text: 'Soğuk'),   
    ],
   ),
   Question(
    id: 2,
    text: "Gideceğiniz yerde deniz olsun mu?" ,
  options: [
      Option(tag: 'sea', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
   Question(
    id: 3,
    text: "Gideceğiniz yerde orman olsun mu?" ,
  options: [
      Option(tag: 'forest', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),     
    ],
   ),
   Question(
    id: 4,
    text: "Gideceğiniz yerde deniz sporlarını denemek ister misiniz?" ,
  options: [
      Option(tag: 'seaSport', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
 Question(
    id: 5,
    text: "Gideceğiniz yerde tarihi yapılar bulunsun mu?" ,
  options: [
      Option(tag: 'historicalPlaces', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
    Question(
    id: 6,
    text: "Gideceğiniz yerde okyanus olsun mu?" ,
  options: [
      Option(tag: 'ocean', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
    Question(
    id: 7,
    text: "Uzak doğu seyehati yapmak ister misiniz?" ,
  options: [
      Option(tag: 'farEast', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
    Question(
    id: 8,
    text: "Seyahatiniz sırasında egzotik hayvanlar görmek ister misiniz?" ,
  options: [
      Option(tag: 'exoticPets', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
    Question(
    id: 9,
    text: "Bir adaya gitmek ister misiniz?" ,
  options: [
      Option(tag: 'island', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),
    Question(
    id: 10,
    text: "Kuzey ışıklarını görmek ister misiniz?" ,
  options: [
      Option(tag: 'northernLights', text: 'Evet'),
      Option(tag: '', text: 'Hayır'),   
    ],
   ),

];