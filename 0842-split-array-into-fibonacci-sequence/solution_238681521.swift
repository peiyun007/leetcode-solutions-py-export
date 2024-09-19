private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func splitIntoFibonacci(_ S: String) -> [Int] {
        var res = [Int]()
        helper(S, &res, 0)
        return res
    }
    
    private func helper(_ S: String, _ res: inout [Int], _ index: Int) -> Bool {
        if index == S.count && res.count >= 3 {
            return true
        }
        for i in index..<S.count {
            if S[index] == "0" && i > index {
                break
            }
            
            let startIndex = S.index(S.startIndex, offsetBy: index)
            let endIndex = S.index(S.startIndex, offsetBy: i)
            let str = S[startIndex...endIndex]
            let longNum = Int64(String(str)) ?? 0
            if longNum >= Int32.max {
                break
            }
            
            let size = res.count
            if size >= 2 && longNum > res[size - 1] + res[size - 2] {
                break
            }
            if size <= 1 || longNum == res[size - 1] + res[size - 2] {
                res.append(Int(longNum))
                if helper(S, &res, i + 1) {
                    return true
                }
                res.removeLast()
            }
        }
        return false
    }
}