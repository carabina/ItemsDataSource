//
//  MainViewController.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 18.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import ItemsDataSource

final class MainViewController: UIViewController {
	
	// MARK: - Injections
	public var healthyDataSourse = ItemsDataSource(sections: [HealthyGroup](),
																								 supplementaryDescriptor: {$0.supplementaryDescriptor!},
																								 cellDescriptor: { $0.itemCellDescriptor })
	
	// MARK: - IBOutlets
	@IBOutlet weak var mainCollectionView: UICollectionView! {
		didSet {
			setMainCollectionViewDataSource()
			mainCollectionView.delegate = self
			setMainCollectionViewLayout()
			mainCollectionView.reloadData()
		}
	}

	// MARK: - Instance Properties
	var healthyModel: HealthyFood?
	
	// MARK: - ViewController LifeCycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: - Helpers
	func setMainCollectionViewDataSource() {
		healthyDataSourse.sections = healthyFood
		mainCollectionView.dataSource = healthyDataSourse
	}
	
	func setMainCollectionViewLayout() {
		let layout = CommonFlowLayout(columns: 1,
																	itemHeight: 60,
																	inset: 0,
																	spacing: 0,
																	lineSpacing: 10,
																	withHeader: true)
		mainCollectionView.collectionViewLayout = layout
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == SegueIdentifier.fromMainToExample {
			let vc = segue.destination as! ExampleViewController
			guard let vitamins =  healthyModel?.vitamins else {
				return
			}
			vc.vitamins = vitamins
		}
	}
	
}
	// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let healthyCell = collectionView.cellForItem(at: indexPath) as! HealthyFoodCell
		guard let model = healthyCell.healthyModel else {
			return
		}
		healthyModel = model
		performSegue(withIdentifier: SegueIdentifier.fromMainToExample, sender: healthyCell)
	}
}
