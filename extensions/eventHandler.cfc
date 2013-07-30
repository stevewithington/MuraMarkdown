/**
* 
* This file is part of MuraMarkdown
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	property name='$' hint='mura scope';

	include '../plugin/settings.cfm';

	public any function onApplicationLoad(required struct $) {
		var class = 'com.petebevin.markdown.MarkdownProcessor';
		var lib = '/MuraMarkdown/extensions/lib/markdownj.jar'; // need to explicitly include the .jar file for Railo
		variables.pluginConfig.addEventHandler(this);
		arguments.$.globalConfig('javaSettingsLoadPaths', ListAppend(arguments.$.globalConfig('javaSettingsLoadPaths'), lib));
		variables.pluginConfig.getApplication().markdown = CreateObject('java', class).init();
		set$(arguments.$);
	}

	public any function onSiteRequestStart(required struct $) {
		arguments.$.setCustomMuraScopeKey(variables.settings.pluginName, this);
		arguments.$.getContentRenderer().injectMethod('renderMarkdown', renderMarkdown);
		set$(arguments.$);
	}

	public any function getMarkdown() {
		return variables.pluginConfig.getApplication().markdown;
	}

	public any function renderMarkdown(string markdown='') {
		return variables.$.MuraMarkdown.getMarkdown().markdown(Trim(arguments.markdown));
	}

}