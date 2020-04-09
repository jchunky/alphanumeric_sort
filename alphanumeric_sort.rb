module AlphanumericSort
  extend self

  def sort(*input)
    input.sort_by(&method(:line_sort_criteria))
  end

  def line_sort_criteria(line)
    line.split.map(&method(:word_sort_criteria))
  end

  def word_sort_criteria(word)
    split_into_fragments(word).map(&method(:fragment_sort_criteria))
  end

  def split_into_fragments(word)
    word
      .chars
      .slice_when(&method(:transition_between_letters_and_numbers))
      .map(&:join)
  end

  def transition_between_letters_and_numbers(a, b)
    (digit?(a) && !digit?(b)) || (!digit?(a) && digit?(b))
  end

  def digit?(char)
    char =~ /\d/
  end

  def fragment_sort_criteria(fragment)
    [fragment.to_i, fragment]
  end
end
