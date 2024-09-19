class Solution {
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var pos = [Character: [Int]]()
        let sArr = Array(s)
        for i in 0..<sArr.count {
            pos[sArr[i], default: []].append(i)
        }
        var res = words.count
        for w in words {
            let wArr = Array(w)
            var p = -1
            for c in wArr {
                guard let arr = pos[c], !arr.isEmpty else {
                    res -= 1
                    break
                }
                if arr[arr.count-1] <= p {
                    res -= 1
                    break
                }
                p = left_bound(arr, p)
            }
        }
        return res
    }

    func left_bound(_ arr: [Int], _ target: Int) -> Int {
        var left = 0, right = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] > target {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return arr[left]
    }
}