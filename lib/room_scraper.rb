class RoomScraper
  def initialize(index_url)

    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))

  end

  def call
    # calls method above and iterates through every single row
    # then calls method below to scrap data and create new instance for each row
    rows.each do |row_doc|
      Room.create_from_hash(scrape_row(row_doc))
       #=> Should put the room in my database.
    end
  end




  private


  def rows
      @rows ||= @doc.search("div.content ul.rows p.result-info")
      
  end

  def scrape_row(row)
      # scrape an individual row
      {
        :date_created => row.search("time").attribute("datetime").text,
        :title => row.search("a.hdrlnk").text,
        :url => "#{@index_url.gsub('/sha','')}#{row.search("a.hdrlnk").attribute("href").text}",
        :price => row.search("span.result-price").text,
      }

    end


end
