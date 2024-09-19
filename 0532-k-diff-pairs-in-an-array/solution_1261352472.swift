class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U

        init(_ f: T, _ s: U) {
            self.f = f
            self.s = s
        }
    }
    typealias PairTwo = Pair<Int, Int>

    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var res = Set<Int>()
        var visited = Set<Int>()
        for x in nums {
            if visited.contains(x-k) {
                res.insert(x-k)
            }
            if visited.contains(x+k) {
                res.insert(x)
            }
            visited.insert(x)
        }
        // print(res)
        return res.count
    }
}