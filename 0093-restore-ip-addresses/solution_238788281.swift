private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var res = [String]()
        var temp = [Int]()
        helper(s, &res, &temp, 0)
        return res
    }
    
    private func helper(_ s: String, _ res: inout [String], _ temp: inout [Int], _ index: Int) -> Bool {
        if temp.count == 4 && index == s.count {
            res.append(temp.map{String($0)}.joined(separator: "."))
            return true
        }
        if temp.count >= 4 {
            return false
        }
        for i in index..<s.count {
            if s[index] == "0" && i > index {
                break
            }
            let startIndex = s.index(s.startIndex, offsetBy: index)
            let endIndex = s.index(s.startIndex, offsetBy: i)
            let num = Int(String(s[startIndex...endIndex])) ?? 0
            
            if num > 255 {
                break
            }
            temp.append(num)
            helper(s, &res, &temp, i + 1)
            temp.removeLast()
        }
        return false
    }
}