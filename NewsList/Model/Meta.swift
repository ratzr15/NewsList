//----------------------------------------------------------------------------------
//  File Name         :  Meta
//  Description       :  Mode for API req
//                    :  Caller : Manager
//                       Manages: Coding and Encoding pf Data
//  Architecture      :  Uncle Bob's Clean Architecture {MVVM}
//  Author            :  Rathish Kannan
//  E-mail            :  rathish.k@sunandsandsports.com
//  Dated             :  13 Nov 2018
//  File Copyrights   :  http://www.json4swift.com
//  Credits           :  https://www.linkedin.com/in/syedabsar
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------


import Foundation
struct Meta : Codable {
	let status : String?
	let totalResults : Int?
	let articles : [Articles]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case totalResults = "totalResults"
		case articles = "articles"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
		articles = try values.decodeIfPresent([Articles].self, forKey: .articles)
	}

}
