//
//  Date+Extensions.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation

extension Date {
    
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }
    
    var dateFormatString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}
