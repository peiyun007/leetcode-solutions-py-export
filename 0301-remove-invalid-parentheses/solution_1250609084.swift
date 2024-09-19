class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var res = [String]()
        var currSet = Set<[Character]>()
        let sArr = Array(s)
        currSet.insert(sArr)

        while !currSet.isEmpty {
            for chs in currSet {
                if isValid(chs) {
                    res.append(String(chs))
                }
            }
            if !res.isEmpty {
                return res
            }
            var nxtSet = Set<[Character]>()
            for chs in currSet {
                for i in 0..<chs.count {
                    if i > 0 && chs[i] == chs[i-1] {
                        continue
                    }
                    if chs[i] == "(" || chs[i] == ")" {
                        var arr = chs
                        arr.remove(at: i)
                        nxtSet.insert(arr)
                    }
                }
            }
            currSet = nxtSet
        }
        return res

    }

    func isValid(_ arr: [Character]) -> Bool {
        var cnt = 0
        for ch in arr {
            if ch == "(" {
                cnt += 1
            } else if ch == ")" {
                cnt -= 1
                if cnt < 0 {
                    return false
                }
            }
        }
        return cnt == 0
    }
}