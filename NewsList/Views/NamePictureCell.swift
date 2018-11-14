//
//  NamePictureCell.swift
//  NewsList
//
//  Created by Rathish Kannan
//  Copyright © 2018 Rathish Kannan. All rights reserved.
//

import UIKit

class NamePictureCell: UITableViewCell {

    @IBOutlet weak var overView: UILabel?
    @IBOutlet weak var pictureImageView: UIImageView?
    @IBOutlet weak var title: UILabel!
    
    var item: ListViewModelItem? {
        didSet {
            guard let item = item as? DetailsItem else {
                return
            }            
            title?.text = item.name
            pictureImageView?.image = UIImage(url: URL(string: item.pictureUrl))
            overView?.text = item.overView
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        pictureImageView?.image = nil
    }    
}
