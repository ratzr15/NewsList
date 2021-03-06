//----------------------------------------------------------------------------------
//  File Name         :  UIImage+Extension.swift
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  14 Nov 2018
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------

import Foundation
import UIKit

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            return nil
        }
    }
}
