module SharesHelper

  def genre(genre)
    if genre == "1"
      return "無選別"
    elsif genre == "2"
      return "やりたいこと"
    elsif genre == "3"
      return "勉強"
    elsif genre == "4"
      return "趣味"
    elsif genre == "5"
      return "恋愛"
    elsif genre == "6"
      return "就活"
    elsif genre == "7"
      return "筋トレ"
    elsif genre == "8"
      return "仕事"
    elsif genre == "9"
      return "その他"
    end
  end

end
