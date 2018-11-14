//----------------------------------------------------------------------------------
//  File Name         :  ListViewModel
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

enum ListViewModelItemType {
    case list
    case details
    case noResult
}

protocol ListViewModelItem {
    var type: ListViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class ListViewModel: NSObject {
    var items = [ListViewModelItem]()
   
    var type:ListViewModelItemType = .list 

    override init() {
        
        super.init()        
    }

    func data(results: [Articles?]){
        if results.count > 0 {
            for result in results {
                if let head = result?.title, let overView = result?.content, let date = result?.author  {
                    let details = ListItem(headLine: head, overView: overView, date: date)
                    items.append(details)
                }
                if let name = result?.title, let overView = result?.description, let date = result?.author  {
                    let details = DetailsItem(name: name, pictureUrl: result?.urlToImage ?? "", overView: overView, date: date)
                    items.append(details)
                }
            }
        }else{
            //Handle no results
            let noResult = NoResultsItem(name:"No Results found, please try again.")
            items.append(noResult)
            print("❌")
        }
    }
}


//MARK: - UITableViewDataSource
extension ListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  items.filter { $0.type == .list }.count > 0 ? items.filter { $0.type == .list }.count : items.filter { $0.type == .noResult }.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.filter { $0.type == .list }.count > 0 ? items.filter { $0.type == .list }[section].rowCount : items.filter { $0.type == .noResult }[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = type == .list ? items.filter { $0.type == .list }[indexPath.section] : items.filter { $0.type == .details }[indexPath.section]
        switch item.type {
        case .list:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath) as? ListCell {
                cell.item = item
                return cell
            }
        case .noResult:
            return UITableViewCell()
        case .details:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].type == .list ? "" : items[section].sectionTitle
    }
}



//MARK: - VM
struct DetailsItem: ListViewModelItem {
    var type: ListViewModelItemType {
        return .details
    }
    
    var sectionTitle: String {
        return self.date
    }
    
    var rowCount: Int {
        return 1
    }
    
    var name: String
    var pictureUrl: String
    var overView: String
    var date: String

    init(name: String, pictureUrl: String, overView: String, date: String) {
        self.name = name
        self.pictureUrl = pictureUrl
        self.overView = overView
        self.date = date
    }
}

struct ListItem: ListViewModelItem {
    var type: ListViewModelItemType {
        return .list
    }
    
    var sectionTitle: String {
        return self.date
    }
    
    var rowCount: Int {
        return 1
    }
    
    var headLine: String
    var overView: String
    var date: String
    
    init(headLine: String, overView: String, date: String) {
        self.headLine = headLine
        self.overView = overView
        self.date = date
    }
}

struct NoResultsItem: ListViewModelItem {
    var type: ListViewModelItemType {
        return .noResult
    }
    
    var sectionTitle: String {
        return self.name
    }
    
    var rowCount: Int {
        return 0
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

