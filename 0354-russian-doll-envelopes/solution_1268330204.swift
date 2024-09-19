class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let envelopesSorted = envelopes.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            } else {
                return $0[0] < $1[0]
            }
        }
        let heights = envelopesSorted.map { $0[1] }
        return lengthOfLIS(heights)
    }

    func lengthOfLIS(_ nums: [Int]) -> Int {
        var top = Array(repeating: 0, count: nums.count)
        var piles = 0
        for i in 0..<nums.count {
            let poker = nums[i]
            var left = 0, right = piles
            while left < right {
                let mid = (left + right) / 2
                if top[mid] > poker {
                    right = mid
                } else if top[mid] < poker {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if left == piles {
                piles += 1
            }
            top[left] = poker
        }
        return piles
    }
}