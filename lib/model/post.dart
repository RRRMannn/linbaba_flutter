class Post{
  const Post({
    this.title,
    this.author,
    this.imageUrl,
  });

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> posts=[
  Post(
    title: "标题1",
    author: "作者1",
    imageUrl: "http://a088.xyz/images/portfolio/0mmexport1554196894459.jpg"
  ),
  Post(
      title: "标题2",
      author: "作者2",
      imageUrl: "http://a088.xyz/images/portfolio/mmexport1554196898034.jpg"
  ),
  Post(
      title: "标题3",
      author: "作者3",
      imageUrl: "http://a088.xyz/images/portfolio/mmexport1554196901314.jpg"
  )
];


