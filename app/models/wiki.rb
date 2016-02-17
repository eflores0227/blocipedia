class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { user ? all : where(private: false) }


  def markdown_body
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})


    markdown.render(self.body).html_safe
  end
end
