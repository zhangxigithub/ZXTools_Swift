//
//  Menu.swift
//  demo
//
//  Created by zhangxi on 11/30/15.
//  Copyright © 2015 zhangxi. All rights reserved.
//

import UIKit

class Menu: UITableViewController {

    let listTitle = ["Color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return listTitle.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = String(indexPath.row+1)+" : "+listTitle[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }

}
