class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    func videoStitching(_ clips: [[Int]], _ time: Int) -> Int {
        var memo = [Pair<Int, Int>: Int]()
        let clipsSorted = clips.sorted {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        }
        let ans = solve(0, 0, clipsSorted, time, &memo)
        return ans == Int.max ? -1 : ans
    }

    func solve(_ idx: Int, _ mx: Int, _ clips: [[Int]], _ time: Int, _ memo: inout [Pair<Int, Int>: Int]) -> Int {
        if mx >= time {
            return 0
        }
        if idx >= clips.count {
            return Int.max
        }
        if let val = memo[Pair(f: idx, s: mx)] {
            return val
        }
        if clips[idx][0] <= mx {
            var temp = solve(idx+1, clips[idx][1], clips, time, &memo)
            temp = (temp == Int.max ? Int.max : temp+1)
            let res = min(temp, solve(idx+1, mx, clips, time, &memo))
            memo[Pair(f: idx, s: mx)] = res
            return res
        }
        memo[Pair(f: idx, s: mx)] = Int.max
        return Int.max
    }
}