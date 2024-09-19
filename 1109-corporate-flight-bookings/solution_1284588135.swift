class Solution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var diff = Array(repeating: 0, count: n+1)
        for b in bookings {
            var i = b[0]-1
            var j = b[1]-1
            var k = b[2]
            diff[i] += k
            diff[j+1] -= k
        }
        var res = Array(repeating: 0, count: n)
        res[0] = diff[0]
        for i in 1..<n {
            res[i] = res[i-1] + diff[i]
        }
        return res
    }
}
