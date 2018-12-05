require_relative 'test_helper'

class OpenMicTest < Minitest::Test

  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_it_exists
    assert_instance_of OpenMic, @open_mic
  end

  def test_it_has_a_location
    assert_equal "Comedy Works", @open_mic.location
  end

  def test_it_has_a_date
    assert_equal "11-20-18", @open_mic.date
  end

  def test_it_has_performers
    assert_equal [], @open_mic.performers
  end

  def test_open_mic_can_welcome_performers
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_open_mic_knows_if_performers_have_same_jokes
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    refute @open_mic.repeated_jokes?
    @sal.learn(@joke_1)
    assert @open_mic.repeated_jokes?
  end

end
