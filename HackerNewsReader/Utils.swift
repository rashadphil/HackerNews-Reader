//
//  Utils.swift
//  HackerNewsReader
//
//  Created by Rashad Philizaire on 6/26/22.
//

import Foundation

class Utils {
    static func fullUrlToDisplayUrl(url: String) -> String {
        let pattern = #"(?:https?):\/\/(?:www\.)?([^\/]+)(?:\/[^\r\n]*)?"#
        let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
        let stringRange = NSRange(location: 0, length: url.utf16.count)
        let matches = regex.matches(in: url, range: stringRange)
        for match in matches {
            for rangeIndex in 1 ..< match.numberOfRanges {
                let nsRange = match.range(at: rangeIndex)
                guard !NSEqualRanges(nsRange, NSMakeRange(NSNotFound, 0)) else { continue }
                let string = (url as NSString).substring(with: nsRange)
                return string
            }
        }
        return ""
    }
}
