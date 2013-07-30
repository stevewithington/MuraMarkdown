<cfscript>
/**
* 
* This file is part of MuraMarkdown
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
md = FileRead(ExpandPath('README.md'));
html = pluginConfig.getApplication().markdown.markdown(md);
WriteOutput(
	$.getBean('pluginManager').renderAdminTemplate(
		body = html
		, pageTitle = pluginConfig.getName()
	)
);
</cfscript>