class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let pArr = Array(pattern)
        let n = pArr.count
        var permutations = [[Int]]()
        var temp = [Int]()
        for i in 1...n+1 {
            temp.append(i)
        }
        permute(0, &temp)
        var smaller = [Int]()
        for p in permutations {
            if match(p) && (smaller.isEmpty || isSmaller(p, smaller)) {
                smaller = p
            }
        }
        return smaller.reduce("") { $0 + String($1) }

        func permute(_ index: Int, _ temp: inout [Int]) {
            if index == n+1 {
                permutations.append(temp)
                return
            }
            for i in index..<n+1 {
                temp.swapAt(index, i)
                permute(index+1, &temp)
                temp.swapAt(i, index)
            }
        }

        func match(_ p: [Int]) -> Bool {
            for (i, ch) in pArr.enumerated() {
                if ch == "I" && p[i] >= p[i+1] { return false }
                if ch == "D" && p[i] <= p[i+1] { return false }
            }
            return true
        }

        func isSmaller(_ arr1: [Int], _ arr2: [Int]) -> Bool {
            for i in 0..<n {
                if arr1[i] < arr2[i] { return true }
                if arr1[i] > arr2[i] { return false } 
            }
            return true
        }
    }
}