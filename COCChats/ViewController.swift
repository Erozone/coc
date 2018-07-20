//
//  ViewController.swift
//  COCChats
//
//  Created by Mohit Kumar on 20/07/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK:- IBOutlets
    
    @IBOutlet weak var clansTblView: UITableView!
    
    //MARK:- UIView methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        registerCells()
        getClans()
    }
    
    //MARK:- User methods
    
    func setupNavBar(){
        let searchController = UISearchController(searchResultsController: nil);
        navigationItem.searchController = searchController;
        self.navigationController?.navigationBar.prefersLargeTitles = true;
    }
    
    func registerCells(){
        let searchCellNib = UINib(nibName: "ClanSearchCell", bundle: nil)
        clansTblView.register(searchCellNib, forCellReuseIdentifier: Constants.CellIds.clanSearchCellId)
    }
    
    //MARK:- TableViewDelegate and Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.clanSearchCellId, for: indexPath)
        
        cell.selectionStyle = .none
        return cell
    }

    //MARK:- IBActions
}

//MARK:- API Methods
extension ViewController{
    
    func getClans(){
        let params = ["name":"The Avengers"]
        
        ServerRequest.performGetRequest(url: Constants.URLs.baseUrl+Constants.URLs.clans, accessToken: Constants.AccessTokens.temporaryToken, params: params);
    }
}

