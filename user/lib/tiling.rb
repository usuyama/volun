module Tiling
 protected
  
  def array_merge (a_array,b_array)
    @column = 0
    if b_array.empty? then
      @contents = a_array
      while @contents.count % 6 != 0 
        randcontent = a_array.rand  
        if randcontent != @contents.last && randcontent != @contents[@contents.size - 3] then
          @contents << randcontent
        end
      end
      @column = @contents.count / 3
    else
      @contents = []
      c_array = Marshal.load(Marshal.dump(a_array))
      while (! b_array.empty?)
        @column = @column + 2
        @contents << b_array.shift
        i = 0
        while i < 4
          if (! c_array.empty?) then
            @contents << c_array.shift
            i = i + 1
          else
            randcontent = a_array.rand  
            if randcontent != @contents.last && 
                randcontent != @contents[@contents.size - 3] &&
              (! (randcontent == @contents[@contents.size - 2] && @contents.last.banner_size_id == 2 ))
            then
              @contents << randcontent
              i = i + 1
            end   
          end
        end        
      end
    end
    return @contents, @column
  end

end

