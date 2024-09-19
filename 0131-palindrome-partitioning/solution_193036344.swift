class Solution {
    func partition(_ s: String) -> [[String]] {
        var res = [[String]]()
        var temp = [String]()
        dfs(&res, &temp, Array(s), 0)
        return res
    }
    
    private func dfs(_ res: inout [[String]], _ temp: inout [String], _ s: [Character], _ index: Int) {
//        res.append(Array(temp))
        if index == s.count {
            res.append(Array(temp))
            return
        }
        for i in index..<s.count {
            let current = String(s[index...i])
            if current.isPalindrome {
                temp.append(current)
                dfs(&res, &temp, s, i + 1)
                temp.removeLast()
            }
        }
    }
}

extension String {
    var isPalindrome: Bool {
        let chars = Array(self)
        var i = 0, j = chars.count - 1
        while i <= j {
            if chars[i] != chars[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}