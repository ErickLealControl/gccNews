//
//  Source.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 03/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import Foundation
struct Source : Codable {
	let id : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
