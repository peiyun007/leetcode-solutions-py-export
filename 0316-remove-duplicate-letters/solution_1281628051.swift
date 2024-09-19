class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let sArr = Array(s)
        var stack = [Character]()
        var vis = Array(repeating: false, count: 26)
        var cnt = Array(repeating: 0, count: 26)
        for ch in sArr {
            cnt[getIndex(ch)] += 1
        }
        for i in 0..<sArr.count {
            let c = sArr[i]
            let idx = getIndex(c)
            if !vis[idx] {
                while !stack.isEmpty && c < stack[stack.count-1] {
                    if cnt[getIndex(stack[stack.count-1])] > 0 {
                        let x = stack.removeLast()
                        vis[getIndex(x)] = false
                    } else {
                        break
                    }
                }
                stack.append(c)
                vis[idx] = true
            }
            cnt[idx] -= 1
        }
        return String(stack)
    }

    func getIndex(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}