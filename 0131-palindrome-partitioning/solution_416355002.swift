extension String {
    subscript(idx: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: idx)]
    }
    
    var isPalindrome: Bool {
        var i = 0
        var j = self.count - 1
        while i < j {
            if self[i] != self[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}



class Solution {
    func partition(_ s: String) -> [[String]] {
        var res = [[String]]()
        var temp = [String]()
        dfs(&res, &temp, s, 0)
        return res
    }
    
    private func dfs(_ res: inout [[String]], _ temp: inout [String], _ s: String, _ index: Int) {
        if index == s.count {
            res.append(temp)
            return
        }
        
        for i in index..<s.count {
            let start = s.index(s.startIndex, offsetBy: index)
            let end = s.index(s.startIndex, offsetBy: i)
            let str = String(s[start...end])
            if str.isPalindrome {
                temp.append(str)
                dfs(&res, &temp, s, i + 1)
                temp.removeLast()
            }
        }
    }
}