class Solution {
    func chalkReplacer(_ chalk: [Int], _ k0: Int) -> Int {
        let n = chalk.count
        let total = chalk.reduce(0) { $0 + $1 }
        var k = k0 % total
        for i in 0..<n {
            let x = chalk[i]
            if k < x {
                return i
            }
            k -= x
        }
        return -1
    }
}