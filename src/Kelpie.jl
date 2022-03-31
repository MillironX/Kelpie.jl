module Kelpie

import EzXML: link!, EzXML

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

end #module
