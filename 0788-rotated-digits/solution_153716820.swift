private extension String {
    func isX() -> Bool {
        let chars = Array(self)
        var hasOne = false
        for char in chars {
            if char == "0" || char == "1" || char == "8" || char == "2" || char == "5" || char == "6" || char == "9" {
                if char == "2" || char == "5" || char == "6" || char == "9" {
                    hasOne = true
                }
            } else {
                return false
            }
        }
        return hasOne
    }
}

class Solution {
    func rotatedDigits(_ N: Int) -> Int {
        var res = 0
        for i in 1...N {
            if String(i).isX() {
                res += 1
            }
        }
        return res
    }
}