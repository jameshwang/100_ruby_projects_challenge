class Translator
  attr_reader :language
  def initialize(language)
    @language = language
  end

  def hi
    case language
    when "spanish"
      "hola mundo"
    when "french"
      "bonjour"
    else
      "hello world"
    end
  end
end
