//
//  HealthyFood.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 21.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import ItemsDataSource

struct HealthyGroup: Groupable {
	let name: String
	var items: [Itemable]
	var supplementaryDescriptor: SupplementaryDescriptor? {
		get {
			return SupplementaryDescriptor(reuseIdentifier: ReuseIdentifier.healthyGroupHeader,
																		 configure: self.configureHealthyFoodpHeader)
		}
	}
}

extension HealthyGroup {
	func configureHealthyFoodpHeader(_ header: HealthyFoodHeader) {
		header.headerLabel.text = name
	}
}
