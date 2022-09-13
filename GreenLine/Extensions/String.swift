//
//  String.swift
//  GreenLine
//
//  Created by EAPPLE on 07/09/2022.
//

import Foundation

enum ValidationType {
    case email
    case nonEmpty
}

extension String {
    public var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var dateFromISO8601: Date? {
        return Date.Formatter.iso8601.date(from: self)
    }
    
    var date: Date? {
        get {
            if let d = dateFromISO8601 {
                return d
            }
            return nil
        }
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx =
        "(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_'{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_'{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func validate(_ type: ValidationType) -> Bool {
        var isValid: Bool
        switch type {
            case .email:
                isValid = self.isValidEmail()
            case .nonEmpty:
                isValid = self.trim().isNotEmpty
        }
        return isValid
    }
    
    func camelCased() -> String {
        let words = self.split(separator: " ")
        return words.map{ $0.prefix(1).uppercased() + $0.dropFirst() }.reduce(""){ $0 + " " + $1 }.trim()
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
