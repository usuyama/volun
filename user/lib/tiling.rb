module Tiling
 protected
  def array_merge (s_sizes,m_sizes,l_sizes)
    es = !s_sizes.empty?
    em = !m_sizes.empty?
    el = !l_sizes.empty?    
    if es && !em && !el then @contents, @column = s_size_only(s_sizes)
    elsif es && em && !el then @contents, @column = s_and_m_sizes(s_sizes,m_sizes)
    elsif es && !em && el then @contents, @column = s_and_l_sizes(s_sizes,l_sizes)
    elsif es && em && el then 
      contents1, column1 = s_and_m_sizes(s_sizes,m_sizes)
      contents2, column2 = s_and_l_sizes(s_sizes,l_sizes)
      @contents = contents1 + contents2
      @column = column1 + column2
      # @contents, @column = all_sizes(s_sizes,m_sizes,l_sizes)
    else
      @contents = []
      @column = 0
    end
  end


  def s_size_only(array)
    contents = array
    if contents.size == 2 then 
      contents = contents + array.reverse
      contents = contents + array
    else
      while contents.count % 6 != 0 
        randcontent = array.rand  
        if randcontent != contents.last && randcontent != contents[contents.size - 2] then
          contents << randcontent
        end
      end
    end
    column = contents.count / 3
    return contents, column
  end

  def s_and_m_sizes(a_array,b_array)
    column = 0
    contents = []
    c_array = Marshal.load(Marshal.dump(a_array))
    while (! b_array.empty?)
      column = column + 2
      contents << b_array.shift
      i = 0
      while i < 4
        if (! c_array.empty?) then
          contents << c_array.shift
          i = i + 1
        else
          randcontent = a_array.rand  
          if randcontent != contents.last && 
              randcontent != contents[contents.size - 2] &&
              (! (randcontent == contents[contents.size - 4] && (contents.last.banner_size_id == 2 || contents[contents.size - 2].banner_size_id == 2)))
          then
            contents << randcontent
            i = i + 1
          end   
        end
      end        
    end
    return contents, column
  end


  def s_and_l_sizes(a_array,b_array)
    column = 0
    contents = []
    c_array = Marshal.load(Marshal.dump(a_array))
    while (! b_array.empty?)
      column = column + 2
      contents << b_array.shift
      i = 0
      while i < 2
        if (! c_array.empty?) then
          contents << c_array.shift
          i = i + 1
        else
          randcontent = a_array.rand  
          if (! (contents.last.banner_size_id != 3 && randcontent == contents.last)) && 
              (! (contents.last.banner_size_id == 3 && randcontent == contents[contents.size - 2]))
          then
            contents << randcontent
            i = i + 1
          end   

        end
      end                       ## end_of_while i < 2
    end                         ## end_of_while (!b~
    return contents, column
  end                           ## end_of_def

  def all_sizes(a_array, b_array, c_array)
    sub_array = Marshal.load(Marshal.dump(a_array))
    all_list =[a_array,b_array,c_array]
    while all_list !=[[],[],[]]
      if all_list[0].empty?
        num = [0,1,2].rand
      end
      if !all_list[num].empty?
        contents << all_list[num].shift
      end
    end
    

  end 

end

