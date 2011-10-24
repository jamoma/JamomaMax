#!/usr/bin/ruby
require 'yaml'


class YamlToMaxref
  require 'rexml/document'
  require 'rexml/formatters/pretty'
  include REXML

  attr :xml, true

  def initialize    
    @xml = Document.new
  end


  def process filepath
    yaml = YAML.load_file(filepath)
    root = Element.new("c74object")
    root.attributes["name"] = filepath.split('/').last.sub(/\.maxref.yml/,'')
    
    e = Element.new("digest")
    e.text = yaml["brief"]
    root.add_element e
 
    e = Element.new("description")
    e.text = yaml["desc"]
    root.add_element e
    # TODO: linking (e.g. the <o> tags for objects in the text)
    
    # METADATA ---------------------------------------------------------------------
		
    e = Element.new("metadatalist")

    author = yaml["author"]
    if author
      meta = Element.new("metadata")
      meta.attributes["name"] = "author"
      meta.text = yaml["author"]
      e.add_element meta
    end
  
    tags = yaml["tags"]
    if tags
      tags.each { |tag|
        meta = Element.new("metadata")
        meta.attributes["name"] = "tag"
        meta.text = tag
        e.add_element meta
       }
    end
  
    root.add_element e
    
    # ATTRIBUTES ---------------------------------------------------------------------
    
    e = Element.new("attributelist")
    
    attributes = yaml["attributes"]
    if attributes
      attributes.each { |a|
        attribute = Element.new("attribute")
        attribute.attributes["name"] = a["name"]
        attribute.attributes["type"] = a["type"]
        if (a["size"])
          attribute.attributes["size"] = a["size"]
        else
          attribute.attributes["size"] = 1
        end
        attribute.attributes["get"] = 1
        attribute.attributes["set"] = 1
        
        attrdig = Element.new("digest")
        attrdig.text = a["desc"]
        attribute.add_element attrdig
        
        attrdesc = Element.new("description")
        attrdesc.text = a["desc"]
        attribute.add_element attrdesc  
        
        e.add_element attribute
      }
    end

    root.add_element e
    
    
    # MESSAGES ---------------------------------------------------------------------
    
    e = Element.new("methodlist")
    
    messages = yaml["messages"]
    if messages
      messages.each { |m|
        message = Element.new("method")
        message.attributes["name"] = m["name"]
        
        messagedig = Element.new("digest")
        messagedig.text = m["desc"]
        message.add_element messagedig
        
        messagedesc = Element.new("description")
        messagedesc.text = m["desc"]
        message.add_element messagedesc
       
        # TODO: add arg list
        
        e.add_element message
      }
    end

    root.add_element e
    
    
    # SEEALSO ---------------------------------------------------------------------
		
    e = Element.new("seealsolist")
  
    seealsos = yaml["seealso"]
    if seealsos
      seealsos.each { |s|
        seealso = Element.new("seealso")
        seealso.attributes["name"] = s
        e.add_element seealso
       }
    end
  
    root.add_element e
    
    
    # MISC ---------------------------------------------------------------------
		
    e = Element.new("misc")
    e.attributes["name"] = "Output"

    outputs = yaml["output"]
    if outputs
      outputs.each { |o|
        output = Element.new("entry")
        output.attributes["name"] = o["name"]
        
        outputdesc = Element.new("description")
        if (o["desc"].class == Array)
          ul = Element.new("ul")
          o["desc"].each { |item| 
            li = Element.new("li")
            li.text = item
            ul.add_element li 
          }
          outputdesc.add_element ul
        else
          outputdesc.text = o["desc"]
        end
        output.add_element outputdesc
        
        e.add_element output
       }
    end
  
    root.add_element e
    
      
    
    # FINISH UP ---------------------------------------------------------------------
    
    @xml.add_element root
  end


  def read filepath
    @xml = Document.new(File.open(filepath))
  end


  def write filepath
    f = File.new(filepath, "w")
    formatter = REXML::Formatters::Pretty.new
    s = ""

    @xml << XMLDecl.new("1.0", "UTF-8")

    formatter.write @xml, s
    #puts s
    
    # Now that we have the XML, perform additional substitutions
    s.gsub! /\#(\S*)/ , '<o>\1</o>'

    f.write(s)
    f.close
  end

end


##################################################################################


if ARGV.size < 2
  puts "must provide the path to the source and the path to the destination (including filename and extension)"
  puts "for example: "
  puts "    ./yaml-to-maxref.rb ../Modules/Plugtastic/implementations/MaxMSP/jcom.plug.parameter/jcom.plug.parameter#.maxref.yml ../Modules/Plugtastic/implementations/MaxMSP/jcom.plug.parameter/jcom.plug.parameter#.maxref.xml"
  exit
end

source_path = ARGV[0]
dest_path = ARGV[1]

maxref = YamlToMaxref.new
maxref.process source_path
maxref.write dest_path

