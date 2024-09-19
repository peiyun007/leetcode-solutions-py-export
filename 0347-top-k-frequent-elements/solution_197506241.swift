/*  解法1：Bucket Sort
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

*/


public struct Heap<T> {
    var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    public var count: Int {
        return nodes.count
    }
    
    private mutating func configureHeap(from array: [T]) {
        self.nodes = array
        for i in stride(from: (nodes.count / 2 - 1), through: 0, by: -1) {
            shiftDown(from: i, until: nodes.count)
        }
    }
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = index * 2 + 1
        let rightChildIndex = leftChildIndex + 1
        var firstIndex = index
        
        if leftChildIndex < endIndex && self.orderCriteria(nodes[leftChildIndex], nodes[firstIndex]) {
            firstIndex = leftChildIndex
        }
        if rightChildIndex < endIndex && self.orderCriteria(nodes[rightChildIndex], nodes[firstIndex]) {
            firstIndex = rightChildIndex
        }
        if firstIndex != index {
            nodes.swapAt(index, firstIndex)
            shiftDown(from: firstIndex, until: endIndex)
        }
    }
    public func peek() -> T? {
        return nodes.first
    }
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && self.orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        nodes[childIndex] = child
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty  else {
            return nil
        }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(from: 0, until: nodes.count)
            return value
        }
    }
}

extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: nodes.count - 1, through : 1, by : -1) {
            nodes.swapAt(0, i)
            shiftDown(from: 0, until: i)
        }
        return nodes
    }
}

public func heapsort<T>(_ a: [T], sort: @escaping (T, T) -> Bool) -> [T] {
    var heap = Heap(array: a, sort: sort)
    return heap.sort()
}

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num] = (map[num] ?? 0) + 1
        }
        let arr = map.map {($0.key, $0.value)}
        var heap = Heap(array: arr) { (tuple1, tuple2) -> Bool in
            return tuple1.1 > tuple2.1
        }
        var res: [Int] = []
        while res.count < k {
            if let topElement = heap.remove()?.0 {
                res.append(topElement)
            }
        }
        return res
    }
}