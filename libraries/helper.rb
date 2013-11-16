class Hash
  def dot_chain
    arr = []
    self.each {|key, value|
      if value.kind_of? Hash
        value.dot_chain.each do |item|
          arr << "#{key}.#{item}"
        end
      elsif value.class == String
        arr << "#{key} = \"#{value}\""
      else
        arr << "#{key} = #{value}"
      end
    }
    arr
  end
end
