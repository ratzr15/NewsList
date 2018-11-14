//----------------------------------------------------------------------------------
//  File Name         :  DetailsViewModel
//  Description       :  Datasource for ViewController
//                       1. Manages -> Data to display
//  Architecture      :  Uncle Bob's Clean Architecture {MVVM}
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  14 Nov 2018
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------

import Foundation
import UIKit

class DetailsViewModel: NSObject {
    var detail = DetailsItem.init(name: "", pictureUrl: "", overView: "", date: "")

    var type:ListViewModelItemType = .details

    override init() {
        super.init()
    }
}


//MARK: - UITableViewDataSource
extension DetailsViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.identifier, for: indexPath) as? NamePictureCell {
            cell.item = detail
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return detail.sectionTitle
    }
}


