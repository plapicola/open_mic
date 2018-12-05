class OpenMic

  attr_reader :location,
              :date,
              :performers

  def initialize(event_information)
    @location = event_information[:location]
    @date = event_information[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    all_performers_jokes = []
    !@performers.inject(true) do |all_unique, performer|
      performer.jokes.each do |joke|
        # Check if current joke is a repeat && ensure no previous repeats
        all_unique = (!all_performers_jokes.include?(joke)) && all_unique
        all_performers_jokes << joke
      end
      all_unique
    end
  end
end
