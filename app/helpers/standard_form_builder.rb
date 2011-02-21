class StandardFormBuilder < ActionView::Helpers::FormBuilder
	def self.create_tagged_field(method_name)
		define_method(method_name) do |label, *args|
			
			if(!args[0][:label].nil?)
				label = args[0][:label]
			end
			
			label_class = ""
			if(!args[0][:label_class].nil?)
				label_class = args[0][:label_class]
			end
			
			@template.content_tag("dt",
				@template.content_tag("label",
															label.to_s.humanize,
															:for => "#{@object_name}_#{label}", :class => label_class) ) +
			@template.content_tag("dd", super(label, *args))
		end
	end
	
	field_helpers.each do |name|
		create_tagged_field(name)
	end
end
	