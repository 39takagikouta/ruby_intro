module Effects
  def self.reverse
    ->(words) do
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    ->(words) do
      words.chars.map { |a| a==' ' ? a : a*rate }.join
    end
  end

  def self.loud(rate)
    ->(words) do
      words.split(' ').map {|a| a.upcase+'!'*2}.join(' ')
    end
  end
end
