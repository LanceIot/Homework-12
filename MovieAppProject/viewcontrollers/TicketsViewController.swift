//
//  TicketsViewController.swift
//  MovieAppProject
//
//  Created by Админ on 25.01.2023.
//

import UIKit

class TicketsViewController: UIViewController {

    private let sectionText: [String] = ["Popular movies", "Popular on TV"]
    
    private lazy var topView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    private lazy var popularTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(PopularTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.popularTableViewCell)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        
        popularTableView.dataSource = self
        popularTableView.delegate = self
    }
}

//MARK: - Table view data source methods

extension TicketsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.popularTableViewCell, for: indexPath) as! PopularTableViewCell
        return cell
    }
    
    
}

//MARK: - Table view delegate methods

extension TicketsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = PopularHeaderView()
        let title = sectionText[section]
        view.configure(with: title)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

//MARK: - Setup views and constraints

extension TicketsViewController {
    
    func setupViews() {
        view.addSubview(topView)
        view.addSubview(popularTableView)
    }
    
    func setupConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        popularTableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
