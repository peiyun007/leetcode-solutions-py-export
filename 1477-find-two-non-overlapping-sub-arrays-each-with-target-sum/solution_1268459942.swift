class Solution {
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        var mp = [Int: Int]()
        mp[0] = -1  //这行很重要
        let n = arr.count
        var sum = 0
        for i in 0..<n {
            sum += arr[i]
            mp[sum] = i
        }
        sum = 0
        var lsz = Int.max
        var res = Int.max
        for i in 0..<arr.count {
            sum += arr[i]
            if let x = mp[sum-target] {
                lsz = min(lsz, i-x)
            }
            if let x = mp[sum+target], lsz != Int.max {
                res = min(res, x-i+lsz)
            }
        }
        return res != Int.max ? res : -1
    }
}