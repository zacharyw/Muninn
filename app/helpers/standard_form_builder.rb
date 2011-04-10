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
			options = args.extract_options!
	
			custom_label = label.to_s.humanize

			custom_label = options[:label] unless options[:label].nil?
			label_class = options[:label_class] unless options[:label_class].nil?
			
			if @object.class.validators_on(label).map(&:class).include? ActiveModel::Validations::PresenceValidator
				if label_class.nil?
					label_class = "required"
				else
					label_class = label_class + " required"
				end
			end	
			
			@template.content_tag("dt",
				@template.content_tag("label",
															custom_label,
															:for => "#{@object_name}_#{label}", :class => label_class) ) +
			@template.content_tag("dd", super(label, *(args << options)))
		end
	end
	
	field_helpers.each do |name|
		create_tagged_field(name)
	end
end
	