class StandardFormBuilder < ActionView::Helpers::FormBuilder
	
	#Replace form submit input with styled buttons
	def submit(label, *args)
		options = args.extract_options!
		new_class = "button"
		new_class = options[:class] unless options[:class].nil?
		super(label, *(args << options.merge(:class => new_class)))
	end
	
=begin
Generates form fields like this:
<dt>Label</dt>
<dd>field</dd>

You can optionally pass in a class for the label on the field helper.
=end
	def self.create_tagged_field(method_name)
		define_method(method_name) do |label, *args|
	
			label_class = ""
			custom_label = label
			if(!args[0].nil?)
				custom_label = args[0][:label] if !args[0][:label].nil?
				label_class = args[0][:label_class] if !args[0][:label_class].nil?
			end
			
			@template.content_tag("dt",
				@template.content_tag("label",
															custom_label.to_s.humanize,
															:for => "#{@object_name}_#{label}", :class => label_class) ) +
			@template.content_tag("dd", super(label, *args))
		end
	end
	
	field_helpers.each do |name|
		create_tagged_field(name)
	end
end
	