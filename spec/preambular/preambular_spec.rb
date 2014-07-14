require_relative '../spec_helper'
require 'tempfile'

describe Preambular do
  
  describe "#load" do
    
    it "should parse the preamble of a single file" do
      result = Preambular.load(standard)    
    end
    
    it "should return the result as a Preambular object" do
      result = Preambular.load(standard)
      expect(result).to be_a Preambular
    end
        
    it "should return a Preambular object with metadata as a Hash" do
      result = Preambular.load(standard)
      expect(result.metadata).to be_a Hash      
    end
    
    it "should return a Preambular object with content as a String" do
      result = Preambular.load(standard)
      expect(result.content).to be_a String      
    end

    it "should accept leading whitespace" do
      Preambular.load(leading_whitespace)
    end
    
    it "should accept an options hash" do
      Preambular.load(standard, {})
    end
    
    it "should accept an encoding option" do
      Preambular.load(standard, {:external_encoding => 'UTF-8'})
    end
    
    it "should read a UTF-8 character" do
      result = Preambular.load(unicode, {:external_encoding => 'UTF-8'})
      expect(result.metadata['unicode_tm']).to eq "\u2122" # "TM"
    end
    
  end

  describe "#metadata_with_content" do
    it "should be the same as the source file" do
      result = Preambular.load(standard)
      expect(File.read(standard)).to eq(result.metadata_with_content)
    end
  end

  describe "#save" do
    it "should save a modified file" do
      result = Preambular.load(standard)
      output_file = Tempfile.new('preamble').path
      result.metadata["key1"] += "!"
      result.save(output_file)

      result = Preambular.load(output_file)
      expect(result.metadata["key1"]).to eq("value1!")
    end
  end
  
  describe "#load_multiple" do
    
    it "should load multiple files" do
      Preambular.load_multiple(standard, leading_whitespace, unicode)
    end
    
    it "should accept options as tail arguments" do
      Preambular.load_multiple(standard, leading_whitespace, unicode, external_encoding: 'UTF-8')
    end
    
  end
  
end