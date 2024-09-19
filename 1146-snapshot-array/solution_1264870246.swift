
class SnapshotArray {
    private var snapId = 0
    private var history = [Int: [(Int, Int)]]()
    
    init(_ length: Int) {
        
    }
    
    func set(_ index: Int, _ val: Int) {
        history[index, default:[(0, 0)]].append((snapId, val))
    }
    
    func snap() -> Int {
        snapId += 1
        return snapId - 1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let arr = history[index, default: []]
        let i = bsearch(arr, snap_id)
        return i < arr.count ? arr[i].1 : 0
    }

    func bsearch(_ arr: [(Int, Int)], _ snap_id: Int) -> Int {
        var left = 0, right = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid].0 <= snap_id {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return max(left - 1, 0)
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */