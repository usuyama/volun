module Tiling
 protected
  
  def array_merge (a_array,b_array)
    @column = 0
    if not b_array.empty? then
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
                randcontent != @contents[@contents.size - 2] &&
              (! (randcontent == @contents[@contents.size - 4] && (@contents.last.banner_size_id == 2 || @contents[@contents.size - 2].banner_size_id == 2)))
            then
              @contents << randcontent
              i = i + 1
            end   
          end
        end        
      end
    else
      onesize_am(a_array)
    end
    return @contents, @column
  end

  def onesize_am(array)
    @contents = array
    if @contents.size == 2 then 
      @contents = @contents + array.reverse
      @contents = @contents + array
    else
      while @contents.count % 6 != 0 
        randcontent = array.rand  
        if randcontent != @contents.last && randcontent != @contents[@contents.size - 2] then
          @contents << randcontent
        end
      end
    end
    @column = @contents.count / 3
  end
  
end

