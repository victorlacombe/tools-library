class Tool < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: :true
  validates :tagline, uniqueness: :true
  validates :website_url, uniqueness: :true
  has_many :tags, dependent: :destroy

  def formatting_tool_tagline(tool)
    first_word = tool.tagline.downcase.split(" ").first.capitalize
    remaining_words = tool.tagline.downcase.split(" ").drop(1).join(" ")
    return formatted_tagline = "#{first_word} #{remaining_words}"
  end

  def formatting_tool_name(tool)
    tool.name.downcase.capitalize
  end
end
