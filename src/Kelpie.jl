module Kelpie

import EzXML: link!, EzXML

export html_element

"""
    link_or_text!(node, content)

Converts `content` to an `EzXML.TextNode` if it isn't already an `EzXML.Node` and links it
to `node`. Will link all nodes in `content` if content is a vector.

```jldoctest
julia> import EzXML: ElementNode, prettyprint; import Kelpie: link_or_text!

julia> prettyprint(link_or_text!(ElementNode("div"), ElementNode("br")))
<div>
  <br/>
</div>

julia> prettyprint(link_or_text!(ElementNode("h1"), "Kelpie.jl"))
<h1>Kelpie.jl</h1>

julia> prettyprint(link_or_text!(ElementNode("div"), ["The end", ElementNode("hr")]))
<div>The end<hr/></div>
```
"""
function link_or_text!(node, content)
    if typeof(content) <: EzXML.Node
        link!(node, content)
    else
        link!(node, EzXML.TextNode(string(content)))
    end #if

    return node
end #function

function link_or_text!(node, content::AbstractArray)
    for con in content
        link_or_text!(node, con)
    end #for

    return node
end #function

"""
    html_element(name, content=nothing; kwargs...)

Creates a new `EzXML.Node` with name `name`, containing `content`, and with attributes
specified by `kwargs`.

# Example

```
julia> import EzXML: prettyprint

julia> prettyprint(html_element("img"; src="https://millironx.com/images/charolette.jpg"))
<img src="https://millironx.com/images/charolette.jpg"/>

julia> prettyprint(html_element("span", "MillironX"; class="label-primary"))
<span class="label-primary">MillironX</span>
```
"""
function html_element(name::AbstractString, content=nothing; kwargs...)
    el = EzXML.ElementNode(name)

    for (key, value) in kwargs
        link!(el, EzXML.AttributeNode(replace(string(key), "_" => "-"), string(value)))
    end #for

    if !isnothing(content)
        link_or_text!(el, content)
    end #if

    return el
end #function

end #module
