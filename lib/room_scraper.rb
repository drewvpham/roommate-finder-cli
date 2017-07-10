class RoomScraper
  def initialize(index_url)

    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
    binding.pry
  end
  def scrape_time
    @doc.search('span.pl time')
  end

  def rows
      @rows ||= @doc.search("div.content ul.rows p.result-info")
      binding.pry
  end

  def scrape_row(row)
      # scrape an individual row
      {
        :date_created => row.search("time").attribute("datetime").text,
        :title => row.search("a.hdrlnk").text,
        :url => "#{@index_url}#{row.search("a.hdrlnk").attribute("href").text}",
        :price => row.search("span.price").text,
      }

    end


end
