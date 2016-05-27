% test cell vector

vec = cellVector();

emptycell = cell(0);
oneitem = cell(1);
randomitems = {'one', 2, 3};
randomitems_len = size(randomitems, 2);

%% Test 1: constructor with no args, items should be empty
vec = cellVector();
expected = {};
actual = vec.items;
assert(isequal(expected, actual))
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 2: constructor with a cell array
vec = cellVector(randomitems);
expected = randomitems;
actual = vec.get_items();
assert(isequal(expected, actual))
expected = randomitems_len;
actual = vec.len();
assert(isequal(expected, actual))

%% Test 3: length

% A) empty list
vec = cellVector();
expected = 0;
actual = vec.len();
assert(isequal(expected, actual))

% B) non-empty list
vec = cellVector(randomitems);
expected = randomitems_len;
actual = vec.len();
assert(isequal(expected, actual))

%% Test 4: push_back to non-empty list
vec = cellVector({1});
vec.push_back(2);
expected = {1, 2};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 5: push_back to empty list
vec = cellVector();
vec.push_back(2);
expected = {2};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 6: push_front to non-empty list
vec = cellVector({1});
vec.push_front(2);
expected = {2, 1};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 7: push_front to empty list
vec = cellVector();
vec.push_front(2);
expected = {2};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 8: pop_back to non-empty list
vec = cellVector({1});
vec.pop_back();
expected = {};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 9: pop_back to empty list, should throw an error
vec = cellVector();
try
   vec.pop_back();
catch e  
  assert(isequal(e.message, 'list is empty'))  
end 

%% Test 10: pop_front to non-empty list
vec = cellVector({1});
vec.pop_front();
expected = {};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 11: pop_front to empty list, should throw an error
vec = cellVector();
try
   vec.pop_front();
catch e    
  assert(isequal(e.message, 'list is empty'))  
end 

%% Test 12: 'set' to non-empty list
vec = cellVector({1});
vec.set(1, 2)
expected = {2};
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 13: 'set' to empty list, should throw an error
vec = cellVector();
try
   vec.set(1, 1);
catch e    
  assert(isequal(e.message, 'list is empty'))  
end 

%% Test 13: 'set' with wrong index, should throw an error
vec = cellVector({1});
try
   vec.set(2, 2);
catch e  
  assert(isequal(e.message, 'index is out of range'))  
end 

%% Test 14: clear
vec = cellVector({1, 2, 3});
expected = {};
vec.clear();
actual = vec.get_items();
assert(isequal(expected, actual))

%% Test 15: concatenate
vec1 = cellVector({1, 2, 3});
vec2 = cellVector({4, 5, 6});
expected = cellVector({1, 2, 3, 4, 5, 6});
vec1.append(vec2);
actual = vec1;
assert(isequal(expected, actual));










