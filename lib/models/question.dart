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


];