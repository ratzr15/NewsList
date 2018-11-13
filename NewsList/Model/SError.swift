//----------------------------------------------------------------------------------
//  File Name         :  SErrorCodes
//  Description       :  Model for API req
//                    :  Caller : Manager
//                       Manages: Error Coding and Encoding of Data
//  Architecture      :  Uncle Bob's Clean Architecture {MVVM}
//  Author            :  Rathish Kannan
//  E-mail            :  rathish.k@sunandsandsports.com
//  Dated             :  13 Nov 2018
//  File Copyrights   :  http://www.json4swift.com
//  Credits           :  https://www.linkedin.com/in/syedabsar
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------

import Foundation
struct SError : Codable {
    let status : String?
    let code : String?
    let message : String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
