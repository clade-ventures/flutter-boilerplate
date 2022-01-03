class QuerySearch {
  String? q;
  int page;
  int perPage;

  QuerySearch({
    this.q,
    this.page = 1,
    this.perPage = 20,
  });

  @override
  String toString() {
    final data = <String, String>{};
    if (q != null) {
      data['q'] = q.toString();
    }
    data['page'] = page.toString();
    data['per_page'] = perPage.toString();
    return Uri(queryParameters: data).query;
  }
}
