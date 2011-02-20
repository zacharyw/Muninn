class StandardFormBuilder < ActionView::Helpers::FormBuilder
	def self.create_tagged_field(method_name)
		define_method(method_name) do |label, *args|
			@template.content_tag("dt",
				@template.content_tag("label",
															label.to_s.humanize,
															:for => "#{@object_name}_#{label}") ) +
			@template.content_tag("dd", super(label, *args))
		end
	end
	
	field_helpers.each do |name|
		create_tagged_field(name)
	end
end
	