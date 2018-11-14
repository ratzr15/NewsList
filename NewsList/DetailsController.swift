//----------------------------------------------------------------------------------
//  File Name         :  DetailsController
//  Description       :  Controller for Details from List
//                       1. Manages -> View for list
//                       2. Invoke -> API to Fetch results
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  13 Nov 2018
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------

import UIKit

class DetailsController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
    var viewModel = DetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.dataSource = viewModel
        viewModel.type  = .details
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

