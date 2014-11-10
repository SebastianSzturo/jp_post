require "open-uri"
require "nokogiri"
require "chronic"

module JpPost
  class Tracking
    # Create a new Tracking object.
    #
    # tracking_number - tracking number of the package to lookup.
    #
    # Returns an instance of JpPost::Tracking.
    def initialize(tracking_number)
      raise ArgumentError unless tracking_number

      @tracking_number = tracking_number
      tracking_url = "https://trackings.post.japanpost.jp/services/srv/search/direct?reqCodeNo1=#{@tracking_number}&locale=en"

      @tracking_page = Nokogiri::HTML(Typhoeus.get(tracking_url).body)
    end

    # "Class of Goods" string from tracking site
    #
    # Returns classification String.
    def classification
      return nil if tracking_is_empty
      
      @delivery_status_details_box ||= @tracking_page.css(".indent table[summary='配達状況詳細']")
      classification = @delivery_status_details_box.css("tr:last .w_380").text.strip
      return classification
    end

    # "Additional Services" string from tracking site
    #
    # Returns additional_services String.
    def additional_services
      return nil if tracking_is_empty

      @delivery_status_details_box ||= @tracking_page.css(".indent table[summary='配達状況詳細']")
      additional_services = @delivery_status_details_box.css(".w_100").last.text.strip
      return additional_services
    end

    # "History Information" table from tracking site
    #
    # Returns tracking history as Array.
    def history
      return nil if tracking_is_empty

      @history_information_box ||= @tracking_page.css(".indent table[summary='履歴情報']")
      history_columns = @history_information_box.css("tr")
      history_columns = history_columns[2..history_columns.size] # remove header

      history = []

      history_columns.each_with_index do |tr, index|
        next if index.odd? # skip zip code row
        date = Chronic.parse(tr.css("td").first.text) rescue nil

        action = tr.css("td")[1].text.strip
        action = nil if action.empty?

        details = tr.css("td")[2].text.strip
        details = nil if action.empty?

        office = tr.css("td")[3].text.strip
        office = nil if action.empty?

        location = tr.css("td")[4].text.strip
        location = nil if action.empty?

        history << { date: date, action: action, details: details, office: office, location: location }
      end

      return history
    end

    private

    def tracking_is_empty
      if @tracking_page.css(".indent table[summary='履歴情報']").empty?
        return true
      else
        return false
      end
    end

  end
end