classdef cellVector < handle
  properties    
    items = cell(0)
  end
  methods
    function obj = cellVector(args)
      if nargin > 0
        if iscell(args)
          obj.items = args;       
        else
          error('value must be cell array');
        end
      end
    end
    
    function value = len(obj)
      value = size(obj.items, 2);
    end
    
    function value = get_items(obj)
      value = obj.items;
    end
    
    function value = at(obj, index)
      value = obj.items{index};
    end
    
    function push_back(obj, value)
      newlen = obj.len() + 1;  
      obj.items{newlen} = value;
    end
    
    function push_front(obj, value)
      if obj.len() == 0
        obj.items{1} = value;
        return;
      end
      for i=1:obj.len()
        obj.items{i+1} = obj.items{i};        
      end
      obj.items{1} = value;      
    end
    
    function value = pop_back(obj)
      if obj.len() == 0
        error('list is empty');
      end
      value = obj.items{obj.len()};
      c = cell(obj.len()-1);
      for i=1:obj.len()-1
        c{i} = obj.items{i};
      end
      obj.items = c;
    end
    
    function value = pop_front(obj)
      if obj.len() == 0
        error('list is empty');
      end      
      value = obj.items{1};
      c = cell(obj.len() - 1);
      for i=1:obj.len()-1
        c{i} = obj.items{i+1};
      end        
      obj.items = c;
    end
    
    function set(obj, index, value)
      if obj.len() == 0
        error('list is empty');
      end
      if index > obj.len()
        error('index is out of range');
      end
      obj.items{index} = value;
    end
    
    function append(obj, vec)
        for i=1:vec.len()
            obj.push_back(vec.at(i));
        end          
    end
    
    function clear(obj)
      obj.items = {};
    end
  end
end
