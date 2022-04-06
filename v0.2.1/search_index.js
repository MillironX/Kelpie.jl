var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"<!– markdownlint-disable first-line-heading –>","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = Kelpie","category":"page"},{"location":"#Kelpie","page":"Home","title":"Kelpie","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Kelpie.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Kelpie]","category":"page"},{"location":"#Kelpie.html-Tuple","page":"Home","title":"Kelpie.html","text":"html(content...=nothing; kwargs...)\n\nCreates a new HTML document filled with content.\n\nExample\n\njulia> import EzXML: prettyprint\n\njulia> prettyprint(html())\n<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<!DOCTYPE html SYSTEM \"about:legacy-compat\">\n<html/>\n\n\n\n\n\n","category":"method"},{"location":"#Kelpie.html_element-Tuple{AbstractString, Vararg{Any}}","page":"Home","title":"Kelpie.html_element","text":"html_element(name, content...=nothing; kwargs...)\n\nCreates a new EzXML.Node with name name, containing content, and with attributes specified by kwargs.\n\nExample\n\njulia> import EzXML: prettyprint\n\njulia> prettyprint(html_element(\"img\"; src=\"https://millironx.com/images/charolette.jpg\"))\n<img src=\"https://millironx.com/images/charolette.jpg\"/>\n\njulia> prettyprint(html_element(\"span\", \"MillironX\"; class=\"label-primary\"))\n<span class=\"label-primary\">MillironX</span>\n\n\n\n\n\n","category":"method"},{"location":"#Kelpie.link_or_text!-Tuple{Any, Vararg{Any}}","page":"Home","title":"Kelpie.link_or_text!","text":"link_or_text!(node, content...)\n\nConverts each content to an EzXML.TextNode if it isn't already an EzXML.Node and links it to node.\n\njulia> import EzXML: ElementNode, prettyprint; import Kelpie: link_or_text!\n\njulia> prettyprint(link_or_text!(ElementNode(\"div\"), ElementNode(\"br\")))\n<div>\n  <br/>\n</div>\n\njulia> prettyprint(link_or_text!(ElementNode(\"h1\"), \"Kelpie.jl\"))\n<h1>Kelpie.jl</h1>\n\njulia> prettyprint(link_or_text!(ElementNode(\"div\"), \"The end\", ElementNode(\"hr\")))\n<div>The end<hr/></div>\n\n\n\n\n\n","category":"method"}]
}