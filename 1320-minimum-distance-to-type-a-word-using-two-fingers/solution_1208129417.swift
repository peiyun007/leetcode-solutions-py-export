class Solution {
    // 参考：花花酱
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }
    var memo = [Pair<Int, Int, Int>: Int]()
    let kUndef = -1

    func cost(_ from: Int, _ to: Int) -> Int {
        if from == kUndef || to == kUndef {
            return 0
        }
        return abs(from / 6 - to / 6) + abs(from % 6 - to % 6)
    }

    func getWordInt(_ c: Character) -> Int {
        let a: Character = "A"
        return Int(c.asciiValue!) - Int(a.asciiValue!)
    }

    func dfs(_ words: [Character], _ i: Int, _ l: Int, _ r: Int) -> Int {
        if i == words.count {
            return 0
        }
        if let val = memo[Pair(f: i, s: l, t: r)] {
            return val
        }
        let c = getWordInt(words[i])
        var res = min(dfs(words, i+1, c, r) + cost(l, c),
        dfs(words, i+1, l, c) + cost(c, r))
        memo[Pair(f: i, s: l, t: r)] = res
        return res
    }

    func minimumDistance(_ word: String) -> Int {
        let words = Array(word)
        return dfs(words, 0, kUndef, kUndef)
    }


}