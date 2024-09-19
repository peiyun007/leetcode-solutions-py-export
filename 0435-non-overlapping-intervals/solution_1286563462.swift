class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let n = intervals.count
        if n == 0 {
            return 0
        }
        let arr = intervals.sorted { 
            if $0[1] == $1[1] {
                return $0[0] > $1[0]
            } else {
                return $0[1] < $1[1]
            }
        }
        var cnt = 0
        var cur = 0
        for i in 1..<n {
            if arr[i][0] >= arr[cur][1] {
                cur = i
            } else {
                cnt += 1  
            }
        }
        return cnt
    }
}