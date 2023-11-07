class Weiss {
  String? rating;
  String? technologyAdoptionRating;
  String? marketPerformanceRating;

  Weiss(
      {this.rating,
      this.technologyAdoptionRating,
      this.marketPerformanceRating});

  Weiss.fromJson(Map<String, dynamic> json) {
    rating = json['Rating'];
    technologyAdoptionRating = json['TechnologyAdoptionRating'];
    marketPerformanceRating = json['MarketPerformanceRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rating'] = rating;
    data['TechnologyAdoptionRating'] = technologyAdoptionRating;
    data['MarketPerformanceRating'] = marketPerformanceRating;
    return data;
  }
}
