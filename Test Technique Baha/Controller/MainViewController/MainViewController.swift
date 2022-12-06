//
//  MainViewController.swift
//  Test Technique Baha
//
//  Created by Bahaeddine Boulaabi on 06/12/2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: -- Outlets of the ViewController
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // MARK: -- Call API
        JetBrainService.instance.getJetBrain { success in
            self.tableView.reloadData()
        }
        // MARK: -- Implementing Pull to Refresh
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    @objc private func didPullToRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            JetBrainService.instance.getJetBrain { success in
                self.tableView.reloadData()
            }
            self.tableView.refreshControl?.endRefreshing()
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: -- Add the number of row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JetBrainService.instance.jetBrainArray.count
    }
    
    // MARK: -- Add data to the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "jetBrainListCell", for: indexPath) as? JetBrainListCell else {return UITableViewCell()}
            var jetBrain = JetBrainService.instance.jetBrainArray[indexPath.row]
            cell.fullNameLbl.text = jetBrain.fullName
            cell.forksLbl.text = String(jetBrain.forks)
            cell.openIssuesLbl.text = String(jetBrain.openIssues)
            cell.watchersLbl.text = String(jetBrain.watchers)
            
            return cell
        }
    
    // MARK: -- Display detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        // MARK: -- Pass data
        vc.jetBraindetail = JetBrainService.instance.jetBrainArray[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
}

