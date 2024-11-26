//
//  ViewController.swift
//  PreviewUIKit
//
//  Created by Arjunan on 18/11/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        collectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "firstCollectionView")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let totalSpacing = layout.sectionInset.left + layout.sectionInset.right + (layout.minimumInteritemSpacing * 2)
          let availableWidth = collectionView.bounds.width - totalSpacing
          let itemWidth = availableWidth / 3
          layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.superview?.layer.cornerRadius = 10
        collectionView.delegate = self
        collectionView.dataSource = self

    }

}

struct Preview: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        return storyboard
    }
}

#Preview(body: {
    Preview()
})

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCollectionView", for: indexPath) as? FirstCollectionViewCell else { return UICollectionViewCell() }
        cell.label.text =  "email".localized()
        return cell
    }
}

extension String {
    /// Returns a localized version of the string using the specified parameters.
    /// - Parameters:
    ///   - tableName: The name of the `.strings` file (or string catalog) to search. Defaults to `nil`.
    ///   - bundle: The bundle containing the localization resources. Defaults to `.main`.
    ///   - locale: The locale to use for localization. Defaults to `.current`.
    ///   - comment: A comment providing context for translators (optional).
    /// - Returns: A localized string based on the specified parameters.
    func localized(
        tableName: String? = "Localizable",
        bundle: Bundle = .main,
        locale: Locale = .current,
        comment: StaticString? = nil
    ) -> String {
        return String(
            localized: String.LocalizationValue(self),
            table: tableName,
            bundle: bundle,
            locale: locale,
            comment: comment ?? ""
        )
    }
}
