class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num] = (map[num] ?? 0) + 1
        }
        var bucket: [[Int]?] = Array(repeating: nil, count: nums.count + 1)
        for (num, freq) in map {
            var arr = bucket[freq]
            if arr == nil {
                arr = Array<Int>()
            }
            arr?.append(num)
            bucket[freq] = arr
        }
        var count = 0
        var res = [Int]()
        for i in (0..<bucket.count).reversed() {
            if bucket[i] == nil {
                continue
            }
            if count >= k {
                break
            }
            count += bucket[i]?.count ?? 0
            res.append(contentsOf: bucket[i]!)
        }
        return res
    }
}