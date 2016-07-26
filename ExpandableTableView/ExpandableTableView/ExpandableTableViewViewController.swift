//
//  ExpandableTableViewViewController.swift
//  ExpandableTableView
//
//  Created by Soubhi Hadri on 26/07/16.
//  Copyright © 2016 Soubhi Hadri. All rights reserved.
//

import UIKit

class ExpandableTableViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCellIndexPath: NSIndexPath?
    
    ////Heigh for cell in subTableView
    let selectedCellHeightForSubTable: CGFloat = 40.0
    
    ///Heigh for cell in Main Table in (unselected)
    let unselectedCellHeight: CGFloat = 110.0
    
    
    ////Array to save references for SubTables
    var subTables:[UITableView] = [UITableView]();
    
    
    ///fake data /// tuples type
    var data:([String],[[String]],[[String]],[[String]])=([String](),[[String]](),[[String]](),[[String]()]);
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///Register Nib file for Main Cells
        tableView.registerNib(UINib(nibName: "ExpandableCellTableViewCell",bundle: nil), forCellReuseIdentifier: "cell");
        
        
        ////Initialize array with fake data
        self.data = self.InitializeDataArray()
        
        self.tableView.reloadData();
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ///Main table
        if tableView == self.tableView{
            return data.0.count;
        }else{
            if let index = self.subTables.indexOf(tableView) {
                return data.1[index].count+1;///+1 for Header cell in subtableView
            }
            return 0;
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if tableView == self.tableView {
            if selectedCellIndexPath == indexPath {
                
                ////unselected Heigh + heigh for every cell in subtable
                return unselectedCellHeight+selectedCellHeightForSubTable*CGFloat(self.data.1[indexPath.row].count+1)
            }
            return unselectedCellHeight
        }else{
            return selectedCellHeightForSubTable
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.tableView {
            if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
                
                let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ExpandableCellTableViewCell;
                
                cell.directionImageView.image = UIImage(named: "down");
                
                tableView.cellForRowAtIndexPath(indexPath)?.viewWithTag(3)!.hidden = true;
                selectedCellIndexPath = nil
                
                
            } else {
                selectedCellIndexPath = indexPath
                
                let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ExpandableCellTableViewCell;
                cell.directionImageView.image = UIImage(named: "up");
                
                tableView.cellForRowAtIndexPath(indexPath)?.viewWithTag(3)!.hidden = false;
            }
            
            
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
            if selectedCellIndexPath != nil {
                // This ensures, that the cell is fully visible once expanded
                tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .None, animated: true)
                
            }
        }
        
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if self.tableView.isEqual(tableView){
            let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ExpandableCellTableViewCell;
            cell.directionImageView.image = UIImage(named: "down");
            cell.viewWithTag(3)!.hidden = true;
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell=UITableViewCell();
        if tableView == self.tableView{
            cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
                as! ExpandableCellTableViewCell;
            
            (cell.viewWithTag(1) as! UILabel).text = self.data.0[indexPath.row]
            
            let subtable = cell.viewWithTag(3) as! UITableView;
            subtable.delegate = self;
            subtable.dataSource = self;
            
            subtable.registerNib(UINib(nibName: "SubTableCellTableViewCell",bundle: nil), forCellReuseIdentifier: "sub_cell");
            
            
            self.subTables.append(subtable);
            
            subtable.reloadData();
            
        }else{
            cell = tableView.dequeueReusableCellWithIdentifier("sub_cell", forIndexPath: indexPath)
            
            print(indexPath.row)
            print(indexPath.section)
            
            if indexPath.row>0{
                if let index = self.subTables.indexOf(tableView) {
                    (cell.viewWithTag(1) as! UILabel).text = self.data.1[index][indexPath.row-1]
                    (cell.viewWithTag(2) as! UILabel).text = self.data.2[index][indexPath.row-1]
                    (cell.viewWithTag(3) as! UILabel).text = self.data.3[index][indexPath.row-1]
                }
            }
            
            
            
        }
        
        cell.selectionStyle = .None
        return cell;
    }
    
    
    public func InitializeDataArray()->([String],[[String]],[[String]],[[String]]){
        
        var mainCells = [String]();
        var col1_SubCells = [[String]]();
        var col2_SubCells = [[String]]();
        var col3_SubCells = [[String]]();
        
        
        ////Expandable Cells Data
        mainCells.append("Cell 1");
        mainCells.append("Cell 2");
        mainCells.append("Cell 3");
        mainCells.append("Cell 4");
//        mainCells.append("Cell 5");
        
        ////First Main cell data
        
        ///First Col////////
        var tempArr:[String] = [String]();
        tempArr.append("m1_col1_row1")
        tempArr.append("m1_col1_row2")
        tempArr.append("m1_col1_row3")
        tempArr.append("m1_col1_row4")
        
        col1_SubCells.append(tempArr);
        
        ///2nd Col
        tempArr = [String]();
        tempArr.append("m1_col2_row1")
        tempArr.append("m1_col2_row2")
        tempArr.append("m1_col2_row3")
        tempArr.append("m1_col2_row4")
        
        col2_SubCells.append(tempArr);
        
        ///3rd Col
        tempArr = [String]();
        tempArr.append("m1_col3_row1")
        tempArr.append("m1_col3_row2")
        tempArr.append("m1_col3_row3")
        tempArr.append("m1_col3_row4")
        
        col3_SubCells.append(tempArr);
        
        
        ////2nd Main cell data////////
        
        ///First Col
        tempArr = [String]();
        tempArr.append("m2_col1_row1")
        tempArr.append("m2_col1_row2")
        tempArr.append("m2_col1_row3")
        tempArr.append("m2_col1_row4")
        
        col1_SubCells.append(tempArr);
        
        ///2nd Col
        tempArr = [String]();
        tempArr.append("m2_col2_row1")
        tempArr.append("m2_col2_row2")
        tempArr.append("m2_col2_row3")
        tempArr.append("m2_col2_row4")
        
        col2_SubCells.append(tempArr);
        
        ///3rd Col
        tempArr = [String]();
        tempArr.append("m2_col3_row1")
        tempArr.append("m2_col3_row2")
        tempArr.append("m2_col3_row3")
        tempArr.append("m2_col3_row4")
        
        col3_SubCells.append(tempArr);
        
        
        
        ////3rd Main cell data////////
        
        ///First Col
        tempArr = [String]();
        tempArr.append("m3_col1_row1")
        tempArr.append("m3_col1_row2")
        tempArr.append("m3_col1_row3")
        
        col1_SubCells.append(tempArr);
        
        ///2nd Col
        tempArr = [String]();
        tempArr.append("m3_col2_row1")
        tempArr.append("m3_col2_row2")
        tempArr.append("m3_col2_row3")
        
        col2_SubCells.append(tempArr);
        
        ///3rd Col
        tempArr = [String]();
        tempArr.append("m3_col3_row1")
        tempArr.append("m3_col3_row2")
        tempArr.append("m3_col3_row3")
        
        col3_SubCells.append(tempArr);
        
        
        ////4th Main cell data////////
        
        ///First Col
        tempArr = [String]();
        tempArr.append("m4_col1_row1")
        tempArr.append("m4_col1_row2")
        tempArr.append("m4_col1_row3")
        
        col1_SubCells.append(tempArr);
        
        ///2nd Col
        tempArr = [String]();
        tempArr.append("m4_col2_row1")
        tempArr.append("m4_col2_row2")
        tempArr.append("m4_col2_row3")
        
        col2_SubCells.append(tempArr);
        
        ///3rd Col
        tempArr = [String]();
        tempArr.append("m4_col3_row1")
        tempArr.append("m4_col3_row2")
        tempArr.append("m4_col3_row3")
        
        col3_SubCells.append(tempArr);
        
        
        
        return (mainCells,col1_SubCells,col2_SubCells,col3_SubCells);
    }
    
    
}
