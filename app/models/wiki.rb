class Wiki < ActiveRecord::Base
  has_many :collaborators
  has_many :users, through: :collaborators


  scope :visible_to, -> (user) { user ? all : where(private: false) }


  def markdown_body
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})


    markdown.render(self.body).html_safe
  end

  def markdown_title
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})

    markdown.render(self.title).html_safe
  end

  # def collaborators
  #   collab = []
  #   @wiki.collaborators.each do |co|
  #     collab << co.user_id
  #   end
  #   collab
  # end
end
