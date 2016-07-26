# ExpandableTableView
 [![](http://img.shields.io/badge/iOS-8.0%2B-blue.svg)]() [![](http://img.shields.io/badge/Swift-2.1-blue.svg)]() 

Expandable TableView in swift (similar to expandable ListView in Android)

![alt tag](https://raw.githubusercontent.com/SubhiH/ExpandableTableView/demo.gif)


### How to use:
All you need are exist in ExpandableExample folder.

1-To change the **height** for **Main** cells, change the value for:
```swift
let unselectedCellHeight: CGFloat = 110.0
```

2-To change the **height** for cells in inner TableView, change the value for:
```swift
let selectedCellHeightForSubTable: CGFloat = 40.0
```
3- Use InitializeDataArray function to insert your own data and return it as tuples type:
```swift
 var data:([String],[[String]],[[String]],[[String]])=([String](),[[String]](),[[String]](),[[String]()]);
```
You can make changes easily to the structure.
for example: if you want to add another column to inner tables, just change the type of data to:

```swift
 var data:([String],[[String]],[[String]],[[String]],[[String]])=([String](),[[String]](),[[String]](),[[String]()],[[String]]);
```

and in cellForRowAtIndexPath function set the value to the 4th label (you should give it tag=4 from IB)
```swift
 (cell.viewWithTag(4) as! UILabel).text = self.data.4[index][indexPath.row-1]
```

Kai Engelhardt's answer helped me: http://stackoverflow.com/a/24921181/2670420


### License
The MIT License (MIT)

Copyright (c) 2016 Soubhi Hadri

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
