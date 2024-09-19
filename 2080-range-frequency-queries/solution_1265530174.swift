
class RangeFreqQuery {
    private var occur = [Int: [Int]]()
    init(_ arr: [Int]) {
        for i in 0..<arr.count {
            occur[arr[i], default:[]].append(i)
        }
    }
    
    func query(_ left: Int, _ right: Int, _ value: Int) -> Int {
        let arr = occur[value, default:[]]
        let lower = lowerBound(arr, left)
        let upper = upperBound(arr, right)
        return upper-lower+1

        func lowerBound(_ arr: [Int], _ x: Int) -> Int {
            var l = 0, r = arr.count
            while l < r {
                let mid = l + (r-l) / 2
                if arr[mid] >= x {
                    r = mid
                } else if arr[mid] < x {
                    l = mid + 1
                }
            }
            return l
        }
        
        func upperBound(_ arr: [Int], _ x: Int) -> Int {
            var l = 0, r = arr.count
            while l < r {
                let mid = l + (r-l) / 2
                if arr[mid] <= x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l - 1
        }
    }
}

/**
 * Your RangeFreqQuery object will be instantiated and called as such:
 * let obj = RangeFreqQuery(arr)
 * let ret_1: Int = obj.query(left, right, value)
 */