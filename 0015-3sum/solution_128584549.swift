class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        let target = 0
        var result = [[Int]]()
        let sorted = nums.sorted{$0 < $1}
        var i = 0
        while i < sorted.count - 2 {
            let remain = target - sorted[i]
            var lo = i + 1
            var hi = sorted.count - 1
            while lo < hi {
                if (sorted[lo] + sorted[hi] > remain){
                    hi = hi - 1
                } else if (sorted[lo] + sorted[hi] == remain) {
                    var three = [Int]()
                    three.append(sorted[i])
                    three.append(sorted[lo])
                    three.append(sorted[hi])
                    result.append(three)
                    repeat {
                        hi = hi - 1
                    } while lo < hi && sorted[hi] == sorted[hi + 1]
                    repeat {
                        lo = lo + 1
                    } while lo < hi && sorted[lo - 1] == sorted[lo]
                } else {
                    lo = lo + 1
                }
            }
            repeat {
                i = i + 1
            } while i < sorted.count - 1 && sorted[i - 1] == sorted[i]
        }
        return result
    }
}