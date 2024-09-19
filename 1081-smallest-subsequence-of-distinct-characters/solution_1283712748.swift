class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var sArr = Array(s)
        var stack = [Character]()
        var cnt = Array(repeating: 0, count: 26)
        var vis = Array(repeating: false, count: 26)
        for i in 0..<sArr.count {
            let ch = sArr[i]
            cnt[getInt(ch)] += 1
        }

        for i in 0..<sArr.count {
            let ch = sArr[i]
            let idx = getInt(ch)
            if !vis[idx] {
                while !stack.isEmpty && ch < stack[stack.count-1] {
                    if cnt[getInt(stack[stack.count-1])] > 0 {
                        let x = stack.removeLast()
                        vis[getInt(x)] = false
                    } else {
                        break
                    }
                }
                stack.append(ch)
                vis[idx] = true
            }
            cnt[getInt(ch)] -= 1
        }
        return String(stack)
    }

    func getInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}