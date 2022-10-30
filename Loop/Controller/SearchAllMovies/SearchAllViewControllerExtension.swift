//
//  File.swift
//  Loop
//
//  Created by Sanjay Mali on 20/10/22.
//

import Foundation
import UIKit
extension SearchAllViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            debugPrint("updatedText : \(updatedText)")
            debugPrint("allMovies : \(allMovies)")
            self.movies = allMovies.filter {$0.title!.lowercased().contains(updatedText.lowercased())}
            debugPrint("movies : \(movies)")
            DispatchQueue.main.async {
//                self.tableView.reloadData()
                self.reloadWithEmptyState()
            }
        }
        return true
    }
}
