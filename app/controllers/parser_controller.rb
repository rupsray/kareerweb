require "rexml/document"
class ParserController < ApplicationController
  def parse(current_user)
  	docxmlpath = "public/resumes/#{current_user.id}/original/word/document.xml"

    # get the XML data as a string and extract information
    xml_data = File.read(docxmlpath)
    doc = REXML::Document.new(xml_data)
    parse_document_to_get_data(doc)
  end

  def parse_document_to_get_data(doc)
  	doc.elements["w:document/w:body"].each do |body_element|
  	  # logger.info"BODY ELEMENT #{body_element.inspect}"
  	  # logger.info"BODY ELEMENT.elements['w:r'] #{body_element.elements['w:r'].inspect}"
      extract_text_from_document(body_element)
      extract_table_content_from_document(body_element)
    end
  end

  def extract_text_from_document(body_element)
  	unless body_element.elements["w:r"].nil?
  	  resume_content = ""
  	  resume_content = get_content_text(body_element,resume_content)
  	  logger.info"resume_content #{resume_content.inspect}"
  	end
  end

  def extract_table_content_from_document(body_element)
  	
  end

  def get_content_text(body_element,resume_content)
  	body_element.elements.each("w:r") do |run_element|
  	  run_element.elements.each("w:t") do |text_element|
  	  	resume_content = resume_content + text_element.text
  	  end
  	end

  	unless resume_content.nil? or resume_content.blank?
      resume_content = resume_content + "<br/>"
    end

    return resume_content
  end

end
