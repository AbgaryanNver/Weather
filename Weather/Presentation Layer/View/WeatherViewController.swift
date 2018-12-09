//
//  WeatherViewController.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/7/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit

let kRowHeight : CGFloat = 135

class WeatherViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var output: WeatherViewOutput?
    var cities : Array<CityEntity>?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.didTriggerViewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output?.didTriggerViewWillDisappear()
    }
    
}

extension WeatherViewController: WeatherViewInput {
    
    func setupInitialState() {
        tableView.rowHeight = kRowHeight
        title = "Cities"
    }
    
    func updateTable(_ infos: Array<CityEntity>) {
        self.cities = infos
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }

}

extension WeatherViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return cities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        if let entity = cities?[indexPath.row] {
            cell.configureCell(entity)
        }
        return cell
    }
}

extension WeatherViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        output?.didTriggerSearchEvent("")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output?.didTriggerSearchEvent(searchText)
    }

}
