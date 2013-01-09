module Util::Email
  module Render
    def render_template_body_type(template)
      result = template.template_type == 'haml' ? render_haml(template.body) : render_erb(template.body)
      result.strip!
    end

    def render_template_subject_type(template)
      result = template.template_type == 'haml' ? render_haml(template.subject) : render_erb(template.subject)
      result.strip!
    end

    def render_haml(template_string)
      Haml::Engine.new(template_string).render(self)
    end

    def render_erb(template_string)
      ERB.new(template_string).result(binding)
    end
  end
end
