class Tool < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy

  def formatting_tool_description(tool)
    first_word = tool.description.downcase.split(" ").first.capitalize
    remaining_words = tool.description.downcase.split(" ").drop(1).join(" ")
    return formatted_description = "#{first_word} #{remaining_words}"
  end

  def formatting_tool_name(tool)
    tool.name.downcase.capitalize
  end
end
