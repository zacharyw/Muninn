module ApplicationHelper
	def standard_form_for(name, *args, &block)
		options = args.extract_options!

		content_tag("div",
			content_tag("dl", form_for(name, *(args << options.merge(:builder => StandardFormBuilder)), &block)),
			:class => "standard_form")
	end
	
	def include_syntaxhighlighter
		javascript_include_tag("syntaxhighlighter/shCore", "syntaxhighlighter/shBrushCss", "syntaxhighlighter/shBrushJava", "syntaxhighlighter/shBrushJScript", "syntaxhighlighter/shBrushRuby", "syntaxhighlighter/shBrushRuby", "syntaxhighlighter/shBrushSass", "syntaxhighlighter/shBrushSql", "syntaxhighlighter/shBrushXml") + stylesheet_link_tag("syntaxhighlighter/shCore", "syntaxhighlighter/shCoreDefault.css")
	end
end
