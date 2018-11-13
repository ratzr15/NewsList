//----------------------------------------------------------------------------------
//  File Name         :  Articles
//  Description       :  Model for API req
//                    :  Caller : Manager
//                       Manages: Coding and Encoding of Data
//  Architecture      :  Uncle Bob's Clean Architecture {MVVM}
//  Author            :  Rathish Kannan
//  E-mail            :  rathish.k@sunandsandsports.com
//  Dated             :  13 Nov 2018
//  File Copyrights   :  http://www.json4swift.com
//  Credits           :  https://www.linkedin.com/in/syedabsar
//  Copyright (c) 2018 Rathish Kannan. All rights reserved.
//-----------------------------------------------------------------------------------

import Foundation
struct Articles : Codable {
	let author : String?
	let title : String?
	let description : String?
	let url : String?
	let urlToImage : String?
	let publishedAt : String?
	let content : String?

	enum CodingKeys: String, CodingKey {

		case author = "author"
		case title = "title"
		case description = "description"
		case url = "url"
		case urlToImage = "urlToImage"
		case publishedAt = "publishedAt"
		case content = "content"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		author = try values.decodeIfPresent(String.self, forKey: .author)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
		publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
		content = try values.decodeIfPresent(String.self, forKey: .content)
	}

}
