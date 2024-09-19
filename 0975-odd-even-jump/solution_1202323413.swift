class Solution {
    // 参考：花花酱

    private func numIndexes(_ arr: [Int], _ op: (Int, Int) -> Bool) -> [Int] {
        let sortedNumIdxParis: [(num: Int, idx: Int)] = arr.enumerated().map { (idx, num) in
            return (num: num, idx: idx)
        }.sorted { p1, p2 in
            return op(p1.num, p2.num)
        }
        
        return sortedNumIdxParis.map { p in
            return p.idx
        }
    }
    
    private func populateOrderedArray(_ array: [Int], _ toPopulate: inout [Int:Int]) {
        var jumpStack = [Int]()
        array.forEach { idx in
            while let last = jumpStack.last, idx > last {
                toPopulate[last] = idx
                jumpStack.removeLast()
            }
            jumpStack.append(idx)
        }
    }

    func oddEvenJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        var nextHigher = [Int:Int]()
        var nextLower = [Int:Int]()
       
        populateOrderedArray(numIndexes(arr, <), &nextHigher)
        populateOrderedArray(numIndexes(arr, >), &nextLower)

        var dp0 = Array(repeating: false, count: arr.count)   //上升跳
        var dp1 = dp0
        var map = [(Int, Int)]()
        dp0[n-1] = true
        dp1[n-1] = true
        var ans = 1
        if n == 1 {
            return 1
        }
        
        for i in (0...n-2).reversed() {
            if let nextHigherIdx = nextHigher[i] {
                dp0[i] = dp1[nextHigherIdx]
            }
            if let nextLowerIdx = nextLower[i] {
                dp1[i] = dp0[nextLowerIdx]
            }
            if dp0[i] {
                ans += 1
            }
        }
        return ans
    }
}