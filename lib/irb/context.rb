module IRB
  class Context
    attr_reader :object, :binding, :line, :source
    
    def initialize(object)
      @object  = object
      @binding = object.instance_eval { binding }
      @line    = 1
      clear_buffer
    end
    
    def evaluate(source)
      eval(source.to_s, @binding)
    end
    
    private
    
    def clear_buffer
      @source = Source.new
    end
  end
end