class Tool < ApplicationRecord
  belongs_to :user
  # validates :name, uniqueness: :true
  # validates :tagline, uniqueness: :true
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

  def clearbit_enrichment
    domain_name = self.format_website_url
    Clearbit.key = ENV['CLEARBIT_KEY']
    company = Clearbit::Enrichment::Company.find(domain: domain_name)
  end

  def format_website_url
    url = self.website_url
    url.match(/^(https?:\/\/)?([\da-z\.-]+\.[a-z\.]{2,6})([\/\w \.-]*)*\/?$/)[2]
  end
end
