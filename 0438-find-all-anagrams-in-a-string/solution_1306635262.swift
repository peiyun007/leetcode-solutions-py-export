class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var left = 0
        var window = [Character: Int]()
        var need = [Character: Int]()
        let sArr = Array(s)
        let tArr = Array(p)
        for c in tArr {
            need[c, default: 0] += 1
        }
        var valid = 0
        var ans = [Int]()
        for right in 0..<sArr.count {
            let chr = sArr[right]
            window[chr, default: 0] += 1
            let cntr = window[chr, default: 0]
            if let val = need[chr], val > 0, cntr == val {
                valid += 1
            }
            while right-left+1 >= tArr.count {
                if valid == need.count {
                    ans.append(left)
                }
                let chl = sArr[left]
                left += 1

                window[chl, default: 0] -= 1
                let cntl = window[chl, default: 0]
                if let val = need[chl], val > 0, cntl == val-1 {
                    valid -= 1
                }
            }
        }
        return ans
    }
}