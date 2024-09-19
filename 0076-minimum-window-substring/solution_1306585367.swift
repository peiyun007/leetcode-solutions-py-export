class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var left = 0
        var window = [Character: Int]()
        var need = [Character: Int]()
        let sArr = Array(s)
        let tArr = Array(t)
        for c in tArr {
            need[c, default: 0] += 1
        }
        var valid = 0
        var start = 0, len = Int.max
        for right in 0..<sArr.count {
            let chr = sArr[right]
            window[chr, default: 0] += 1
            let cntr = window[chr, default: 0]
            if let val = need[chr], val > 0, cntr == val {
                valid += 1
            }
            while valid == need.count {
                if right - left + 1 < len {
                    start = left
                    len = right-left+1
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
        if len == Int.max {
            return ""
        } else {
            return String(sArr[start..<start+len])
        }
    }
}