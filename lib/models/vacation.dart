class Vacation {
  final int id;
  final List<String> tags;
  final String photUrl;
  final String text;

  const Vacation({
    required this.id,
    required this.tags,
    required this.photUrl,
    required this.text,
  });
}

List<Vacation> vacations = [
  Vacation(
    id: 1,
    tags: ["hot", "sea"],
    photUrl: "",
    text: "asasdasdsf",
  ),
  Vacation(
    id: 2,
    tags: ["hot", "sea"],
    photUrl: "",
    text: "asassfefefdsdsdsffedasds Adas",
  ),
  Vacation(
    id: 3,
    tags: ["hot", "sea","forest"],
    photUrl: "",
    text: "asasdasdfsazzzzsdsf DCS SCZXCVDS dsvxc",
  ),
];
