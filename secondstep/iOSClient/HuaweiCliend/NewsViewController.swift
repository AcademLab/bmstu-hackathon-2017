//
//  MasterViewController.swift
//  HuaweiCliend
//
//
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

fileprivate let kNewsItemCellReuseIdentifier = "Cell"
fileprivate let kSegueIdentifierShowDetails = "showDetails"

class NewsViewController: AcademViewController, UITableViewDelegate, UITableViewDataSource, NewsViewModelDelegate, NewsTableViewCellDelegate {

	@IBOutlet var tableView : UITableView!
	
	var viewModel : NewsViewModel? = AcademicNewsViewModel(model: AcademicNewsModel())
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel?.updateData()
	}
	
	override func setup() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.estimatedRowHeight = 140
		tableView.rowHeight = UITableViewAutomaticDimension
		
		viewModel?.delegate = self
		
		title = "Company News"
		
	}
	
	// MARK: Segue
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard segue.identifier == kSegueIdentifierShowDetails,
				let destinationVC = segue.destination as? NewsItemViewController,
				let sender = sender as? UITableViewCell,
				let indexPath = tableView.indexPath(for: sender) else {
			return
		}
		
		let newsItem = viewModel?.newsItems?[indexPath.row]
		destinationVC.newsItemUrl = newsItem?.link
		
	}
	
	// MARK: - Table View

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: kNewsItemCellReuseIdentifier, for: indexPath) as! NewsTableViewCell
		
		let newsItem = viewModel?.newsItems?[indexPath.row]
		
		cell.titleLabel?.text = newsItem?.title
		cell.titleLabel?.numberOfLines = 3
		cell.detailLabel?.text = newsItem?.pubDate?.formattedDate()
		cell.delegate = self
		cell.url = newsItem?.link
		
		return cell
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.newsItems?.count ?? 0
	}
	
	// MARK: NewsViewModelDelegate

	func didFailedLoadNews(errMsg: String) {
		showMessage(errMsg)
	}
	
	func didUpdateNews(newsItems: [NewsItem]) {
		self.tableView.reloadData()
	}
	
	// MARK : NewsTableViewCellDelegate
	
	func presentSheet(fbSheet : UIViewController?) {
		guard let fbSheet = fbSheet else { return }
		
		self.present(fbSheet, animated: true, completion: nil)
	}
	func presentAlert(alertVC : UIAlertController) {
		self.present(alertVC, animated: true, completion: nil)
	}

}

