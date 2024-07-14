//
//  SearchViewModel.swift
//  Ios Wheather App
//
//  Created by Bholanath Barik on 07/07/24.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var searchText = "";
    
    func clearSearchBarText() {
        self.searchText = "";
    }
    
    func extractDate(from dateString: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: date)
        } else {
            return nil
        }
    }
    
    func extractTimeAmPm(from dateString: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: date)
        } else {
            return nil
        }
    }
}
