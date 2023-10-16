//
//  String+.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 2023/10/16.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
    
    func isOnlyKorean() -> Bool {
        let pattern = "[가-힣]"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
}
