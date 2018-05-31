# MuraMarkdown

This [Mura CMS](http://getmura.com) plugin uses the [MarkdownJ library](https://code.google.com/p/markdownj/). MarkdownJ is pure Java port of Markdown (a text-to-html conversion tool written by John Gruber).

## Instructions

You can render markdown syntax as HTML in one of two ways with this plugin:

1. **Via CFML**

	Use this method when you wish to render markdown within a .CFM file:

		#$.renderMarkdown('This is a *simple* example')#

2. **Via [Mura] Tags**

	Use this method when you wish to render markdown within the CKEditor window:

		[mura]$.renderMarkdown('This is a *simple* example')[/mura]

## Example Code
The example below is to illustrate how you might actually use this plugin in your own code using the included README.md file as a test file:

	<cfscript>
		md = FileRead(ExpandPath('README.md'));
		html = $.renderMarkdown(md);
		WriteOutput(html);
	</cfscript>


## Resources
* [MarkdownJ library](https://code.google.com/p/markdownj/)
* [Markdown Basics](http://daringfireball.net/projects/markdown/basics)

## Minimum Requirements
* Mura CMS Core Version **6.1+**
* Adobe ColdFusion **10+**
* Railo **4+**

## Tested With
* Mura CMS Core Version 6.1+
* Adobe ColdFusion 10.0.9
* Railo 4.0.4

## License
Copyright 2013 Stephen J. Withington, Jr.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
