class NewsModel{
   int? id;
   String? name;
   String? urltoimage;
   String? author;
   String? desc;
   String? content;
   String? source;
   String? publishedAt;


   NewsModel({
    required this.id,
    required this.name,
    required this.urltoimage,
    required this.author,
    required this.desc,
    required  this.content,
    required this.source,
    required this.publishedAt,
  });

  NewsModel.fromjson({required Map<String?,dynamic>data}){
    id=data['source']['id'];
    name=data['source']['name'];
    urltoimage=data['urlToImage'];
    author=data['author'];
    desc=data['description'];
    content=data['content'];
   source=data['source'];
  }
}

