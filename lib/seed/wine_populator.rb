class WinePopulator
  def initialize(wine_csv_file)
    @wine_csv_file = wine_csv_file
  end

  def populate
    lines = IO.read(@wine_csv_file, :encoding => "UTF-8").split("\n")
    lines.delete_at(0)

    lines.each do |line|
      line.gsub("\"\"", "'")
      data = String.split_respecting_double_quotes(line,',')
      next if data[8].empty?  or data[10].empty?
      create_wine(data)
    end
  end

  def create_wine(data)
    body_hash = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4}
    wine = Wine.new
    wine.name = data[1]
    wine.vintage = data[2]
    wine.varietal = data[3]
    wine.wine_type = data[4]
    wine.country = data[5]
    wine.region = data[6]
    wine.rating = data[7]
    wine.body = body_hash[data[8]]
    wine.price = data[9].nil? ? rand(15) : data[9]
    wine.sweetness = data[10]
    wine.save
  end
end
