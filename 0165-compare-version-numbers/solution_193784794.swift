import Foundation

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1s = version1.split(separator: ".")
        let v2s = version2.split(separator: ".")
        
        for i in 0..<max(v1s.count, v2s.count) {
            let v1 = i < v1s.count ? atoi(String(v1s[i])) : 0
            let v2 = i < v2s.count ? atoi(String(v2s[i])) : 0
            if v1 < v2 {
                return -1
            } else if v1 > v2 {
                return 1
            }
        }

        return 0
    }
}