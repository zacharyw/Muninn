module ApplicationHelper
	def standard_form_for(name, *args, &block)
		options = args.extract_options!

		content_tag("div",
			content_tag("dl", form_for(name, *(args << options.merge(:builder => StandardFormBuilder)), &block)),
			:class => "standard_form")
	end
end
