//
//  MasterViewController.swift
//  HuaweiCliend
//
//
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var fullName: UILabel!
	var objects = ["Foo", "Bar", "Foo", "Bar", "Foo", "Bar", "Foo", "Bar"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	// MARK: - Table View

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = objects[indexPath.row]
		return cell
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	// MARK: - Data Source
 
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return objects.count
	}

}

