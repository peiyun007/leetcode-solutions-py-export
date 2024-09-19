class Solution {
    struct Pair<T: Hashable, U: Hashable> : Hashable {
        let first: T
        let second: U
    }
    private var memo = [Pair<Int, Int>: Int]()
    private let inf = Int.max - 2
    func dfs(_ n: Int, _ clipboard: Int, _ currentStr: Int) -> Int {
        if currentStr == n {
            return 0
        }
        if clipboard > n || currentStr > n {
            return inf
        }
        if let val = memo[Pair(first: clipboard, second: currentStr)] {
            return val
        }
        var copyAll = clipboard < currentStr ? dfs(n, currentStr, currentStr) : inf
        var paste = clipboard > 0 ? dfs(n, clipboard, currentStr + clipboard) : inf
        var temp = min(copyAll, paste)
        let res = 1 + temp
        memo[Pair(first: clipboard, second: currentStr)] = res
        return res
    }

    func minSteps(_ n: Int) -> Int {
        return dfs(n, 0, 1)
    }
}