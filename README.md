# Matlab cell array as vector

Makes working with cell arrays in Matlab easier.

## Operations

Create:

```
vec = cellVector()            % Creates empty vector
vec = cellVector({1, 2, 3})   % Creates vector from a cell array
```

Remove items:

```
vec.clear()
```

Add items:

```
>> vec.push_back(2)
>> vec.push_front(1)
>> vec

vec =

  cellVector with properties:

    items: {[2]  [1]}
```

Modify an item:

```
>> vec.set(1, 5)
>> vec

vec =

  cellVector with properties:

    items: {[5]  [1]}
```

Get value of an item:

```
>> vec.at(1)

ans =

     5
```

Get cell array:

```
>> vec.get_items()

ans =

    [5]    [1]
```

Pop item:

```
>> vec = cellVector({1, 2, 3})

vec =

  cellVector with properties:

    items: {[1]  [2]  [3]}

>> front = vec.pop_front()  % Get first item and remove it from the vector

front =

     1

>> back = vec.pop_back()    % Get last item and remove it from the vector

back =

     3

>> vec

vec =

  cellVector with properties:

    items: {[2]}
```

Append another vector:

```
>> vec1 = cellVector({1, 2, 3});
>> vec2 = cellVector({4, 5, 6});
>> vec1.append(vec2)
>> vec1

vec1 =

  cellVector with properties:

    items: {[1]  [2]  [3]  [4]  [5]  [6]}
```

