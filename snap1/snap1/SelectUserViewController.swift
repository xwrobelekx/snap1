//
//  SelectUserViewController.swift
//  snap1
//
//  Created by Kamil Wrobel on 4/4/17.
//  Copyright © 2017 Kamil Wrobel. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView1: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.tableView1.dataSource = self
        self.tableView1.delegate = self
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        code
    }
 

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
