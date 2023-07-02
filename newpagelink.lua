-- newpagelink.lua

-- added this in an attempt to make the sidebar tools icons open in new tab

function Link(link)
  if link.target:match '^https?%:' then
   -- link.attributes.target = '_blank' -- unsure which syntax is right!
    link.attributes["target"] = "_blank"
    return link
  end
end