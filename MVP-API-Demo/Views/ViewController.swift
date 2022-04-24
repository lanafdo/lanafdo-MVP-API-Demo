//
//  ViewController.swift
//  MVP-API-Demo
//
//  Created by Lana Fernando S on 24/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PopulationProtocol = PopulationPresenter()
    var populationArray : [PopulationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigtionItem()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPopulation()
    }
    
    private func setNavigtionItem() {
        self.navigationItem.title = "MVP API"
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: PopulationConstant.Nibs.populationCell, bundle: nil), forCellReuseIdentifier: PopulationConstant.Nibs.populationCell)
    }

    private func fetchPopulation() {
        presenter.getPopulation { [weak self] populations in
            DispatchQueue.main.async {
                self?.populationArray = populations ?? []
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.populationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopulationConstant.Nibs.populationCell, for: indexPath) as! PopulationTableViewCell
        cell.model = self.populationArray[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
