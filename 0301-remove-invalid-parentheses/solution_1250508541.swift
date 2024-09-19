class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var res = [String]()
        let sArr = Array(s)
        var lRemove = 0, rRemove = 0
        for ch in sArr {
            if ch == "(" {
                lRemove += 1
            } else if ch == ")" {
                if lRemove == 0 {
                    rRemove += 1
                } else {
                    lRemove -= 1
                }
            }
        }
        dfs(sArr, 0, lRemove, rRemove)
        return res

        func dfs(_ chArr: [Character], _ start: Int, _ lRemove: Int, _ rRemove: Int) {
            if lRemove == 0 && rRemove == 0 {
                if isValid(chArr) {
                    res.append(String(chArr))
                }
                return
            }
            
            for i in start..<chArr.count {
                if i != start && chArr[i] == chArr[i-1] {
                    continue
                }
                if lRemove + rRemove > chArr.count - i {
                    return
                }
                if lRemove > 0 && chArr[i] == "(" {
                    var arr = chArr
                    arr.remove(at: i)
                    dfs(arr, i, lRemove-1, rRemove)  // 注意第二个参数应该传i而不是i+1
                }
                if rRemove > 0 && chArr[i] == ")" {
                    var arr = chArr
                    arr.remove(at: i)
                    dfs(arr, i, lRemove, rRemove-1)
                }
            }
        }
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