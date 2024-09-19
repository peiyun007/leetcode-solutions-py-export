private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func isAdditiveNumber(_ num: String) -> Bool {
        var res = [Int]()
        return helper(num, &res, 0)
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
            if res.count >= 2 && longNum > res[res.count - 1] + res[res.count - 2] {
                break
            }
            if res.count < 2 || longNum == res[res.count - 1] + res[res.count - 2] {
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