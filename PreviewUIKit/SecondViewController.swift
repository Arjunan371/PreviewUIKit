//
//  SecondViewController.swift
//  PreviewUIKit
//
//  Created by Arjunan on 18/11/24.
//

import UIKit
import SwiftUI

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        tableView?.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "tableView")
        tableView?.separatorStyle = .none
        tableView?.showsVerticalScrollIndicator = false
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.reloadData()
    }
}

private struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                return storyboard.instantiateViewController(withIdentifier: "SecondViewController")
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

#Preview(body: {
    ViewControllerRepresentable()
})

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as? SecondTableViewCell else { fatalError("not load SecondTableViewCell")}
        cell.cellLabel.text = "tableView cell"
        return cell
    }
}
