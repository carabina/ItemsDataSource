//
//  CellDescriptor.swift
//  ItemsDataSource
//
//  Created by Sasha Prokhorenko on 06.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

/// CellDescriptor
public struct CellDescriptor {
	
	// MARK: - Instance Properties
	public let cellClass: UICollectionViewCell.Type
	public let reuseIdentifier: String
	public let configure: (UICollectionViewCell) -> ()
	
	// MARK: - Object lifecycle
	public init<Cell: UICollectionViewCell>(reuseIdentifier: String, configure: @escaping (Cell) -> ()) {
		self.cellClass = Cell.self
		self.reuseIdentifier = reuseIdentifier
		self.configure = { cell in
			configure(cell as! Cell)
		}
	}
}
