//
//  DateConverter.swift
//  SwapCardTestApp
//
//  Created by Taras Nikulin on 05.02.2018.
//  Copyright © 2018 Taras Nikulin. All rights reserved.
//

import Foundation

final class DateConverter {
    func convert(dateString: String, inputDateFormat: String, outputDateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = inputDateFormat
        guard let date = formatter.date(from: dateString) else {
            return dateString
        }
        formatter.dateFormat = outputDateFormat
        return formatter.string(from: date)
    }
}
