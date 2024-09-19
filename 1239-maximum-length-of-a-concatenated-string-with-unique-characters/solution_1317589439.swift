class Solution {
    func maxLength(_ arr: [String]) -> Int {
        let n = arr.count
        var masks = [Int]()
        for str in arr {
            var mask = 0
            let sArr = Array(str)
            for i in 0..<sArr.count {
                let ch = sArr[i]
                let chx = getInt(ch)
                if (mask >> chx) & 1 != 0 {
                    mask = 0
                    break
                }
                mask |= (1 << chx)
            }
            if mask > 0 {
                masks.append(mask)
            }
        }
        var ans = 0
        dfs(0, 0)
        return ans

        func dfs(_ idx: Int, _ mask: Int) {
            if idx == masks.count {
                ans = max(ans, onesCount(mask))
                return
            }
            if mask & masks[idx] == 0 {
                dfs(idx+1, mask | masks[idx])
            }
            dfs(idx+1, mask)
        }
    }

    func getInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }

    func onesCount(_ n0: Int) -> Int {
        var n = n0
        var ones = 0
        while n > 0 {
            n = n & (n-1)
            ones += 1
        }
        return ones
    }
}