//----------------------------------------------------------------------------------
//  File Name         :  ViewController.swift
//  Description       :  Controller for List
//                       1. Manages -> View for list
//                       2. Invoke -> API to Fetch results
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  13 Nov 2018
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
   
    fileprivate let viewModel = ListViewModel()

    let manager = ListManager()

    var param = Query(country: "us", page: "", id: "6fb52f2be2754dc7871284da64b8e129", count: "30")

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = viewModel
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(ListCell.nib, forCellReuseIdentifier: ListCell.identifier)
        setUpData()
    }
    
    private func setUpData(){
        manager.request(query: param){  (results) in
            self.viewModel.data(results: results?.articles ?? [])
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: DetailsController.self)) as! DetailsController
        let details = viewModel.items.filter { $0.type == .details }
        if let detail = details[indexPath.row] as? DetailsItem {
            vc.viewModel.detail = detail
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
