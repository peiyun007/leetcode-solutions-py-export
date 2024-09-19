class Solution {

    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }
    var memo = [Pair<Int, Int, Int>: Int]()

    func dp(_ boxes: [Int], _ i: Int, _ j: Int, _ k: Int) -> Int {
        if j < i {
            return 0
        }
        if let val = memo[Pair(f: i, s: j, t: k)] {
            return val
        }
        var res = dp(boxes, i, j-1, 0) + (k+1) * (k+1)
        for l in i..<j {
            if boxes[l] == boxes[j] {
                res = max(res, dp(boxes, i, l, k+1) + dp(boxes, l+1, j-1, 0))
            }
        }
        memo[Pair(f: i, s: j, t: k)] = res
        return res
    }

    func removeBoxes(_ boxes: [Int]) -> Int {
        return dp(boxes, 0, boxes.count-1, 0)
    }

}