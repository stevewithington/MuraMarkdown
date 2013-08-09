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
		var paths = [ExpandPath('/#variables.settings.package#/extensions/lib/markdownj.jar')];
		var javaLoader = new mura.javaloader.JavaLoader(paths);
		variables.pluginConfig.getApplication().markdown = javaLoader.create('com.petebevin.markdown.MarkdownProcessor');
		variables.pluginConfig.addEventHandler(this);
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