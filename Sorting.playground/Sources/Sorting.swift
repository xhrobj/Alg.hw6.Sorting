public struct Sorting<Element: Comparable> {
    
    // https://ru.wikipedia.org/wiki/Сортировка_пузырьком
    
    // BUB1. +1 байт. Реализовать алгоритм BubbleSort.
    public static func _buble0(_ xx: [Element]) -> [Element] {
        var xx = xx, count = xx.count
        
        while count > 0 {
            for i in 0..<(xx.count - 1) {
                if xx[i] > xx[i + 1] {
                    xx.swapAt(i, i + 1)
                }
            }
            count -= 1
        }
        
        return xx
    }
    
    // BUB2. +1 байт. Оптимизировать алгоритм BubbleSort.
    public static func buble(_ xx: [Element]) -> [Element] {
        var xx = xx, count = xx.count
        
        while count > 0 {
            var f = false
            for i in 0..<(xx.count - 1) {
                if xx[i] > xx[i + 1] {
                    f = true
                    xx.swapAt(i, i + 1)
                }
            }
            guard f else { break }
            count -= 1
        }
        
        return xx
    }
    
    // https://ru.wikipedia.org/wiki/Сортировка_вставками
    
    public static func _insertion0(_ xx: [Element]) -> [Element] {
        guard xx.count > 1 else { return xx }

        var xx = xx
        for i in 1..<xx.count {
            for j in stride(from: i, to: 0, by: -1) where xx[j - 1] > xx[j] {
                xx.swapAt(j - 1, j)
            }
        }
        
        return xx
    }
    
    // INS1. +1 байт. Реализовать алгоритм InsertionSort.
    public static func _insertion1(_ xx: [Element]) -> [Element] {
        guard xx.count > 1 else { return xx }
        
        var xx = xx
        for i in 1..<xx.count {
            var j = i
            while j > 0 && xx[j - 1] > xx[j] {
                xx.swapAt(j - 1, j)
                j -= 1
            }
        }
        
        return xx
    }
    
    // INS2. +1 байт. Оптимизировать алгоритм InsertionSort, сделать сдвиг элементов вместо обмена.
    public static func insertion(_ xx: [Element]) -> [Element] {
        var xx = xx
        
        for i in 0..<xx.count {
            let x = xx[i]
            var j = i - 1
            while j >= 0 && xx[j] > x {
                xx[j + 1] = xx[j]
                j -= 1
            }
            xx[j + 1] = x
        }
        
        return xx
    }
    
    // INS3. +1 байт. Оптимизировать алгоритм InsertionSort, сделать бинарный поиск места вставки.
    
    //
    // ???: вот здесь я не понял, какой смысл искать бинарным поиском место вставки дополнительной операцией (logN),
    //      если потом все равно нужно сделать N операций сдвига? Разве не быстрее сразу начать двигать, как в INS2?
    //

    // https://ru.wikipedia.org/wiki/Сортировка_Шелла
    
    // SHS1. +1 байт. Реализовать алгоритм ShellSort.
    public static func shell(_ xx: [Element]) -> [Element] {
        var xx = xx
                
        let length = xx.count
        var h = 1
        
        while h < length / 3 {
            h = 3 * h + 1
        }
        
        while h >= 1 {
            for i in h..<length {
                for j in stride(from: i, to: h - 1, by: -h) {
                    if xx[j] < xx[j - h] {
                        xx.swapAt(j, j - h)
                    } else {
                        break
                    }
                }
            }
            h /= 3
        }
        
        return xx
    }
    
    // https://ru.wikipedia.org/wiki/Сортировка_выбором
    
    public static func _selection0(_ xx: [Element]) -> [Element] {
        var xx = xx, result = [Element]()
        while xx.count > 0 {
            var min = xx[0], minIndex = 0
            for i in 1..<xx.count {
                if xx[i] < min {
                    min = xx[i]
                    minIndex = i
                }
            }
            result.append(min)
            xx.remove(at: minIndex)
        }
        return result
    }
    
    public static func selection(_ xx: [Element]) -> [Element] {
        var xx = xx
        for i in 0..<(xx.count-1) {
            var min = xx[i], minIndex = i
            for j in (i + 1)..<xx.count {
                if xx[j] < min {
                    min = xx[j]
                    minIndex = j
                }
            }
            guard i != minIndex else { continue }
            xx.swapAt(i, minIndex)
        }
        return xx
    }
    
    // https://ru.wikipedia.org/wiki/Пирамидальная_сортировка
    
    public static func heap(_ xx: [Element]) -> [Element] {
        guard xx.count > 1 else { return xx }
        var xx = xx
        buildHeap(&xx)
        shrinkHeap(&xx)
        return xx
    }
      
    private static func buildHeap(_ xx: inout [Element]) {
        for index in 1..<xx.count {
            var child = index
            var parent = child.parent
            while child > 0 && xx[child] > xx[parent] {
                xx.swapAt(child, parent)
                child = parent
                parent = child.parent
            }
        }
    }
      
    private static func shrinkHeap(_ xx: inout [Element]) {
        for index in stride(from: xx.count - 1, to: 0, by: -1) {
            xx.swapAt(0, index)
            var parent = 0
            var leftChild = parent.leftChild
            var rightChild = parent.rightChild
            while parent < index {
                var maxChild = -1
                if leftChild < index {
                    maxChild = leftChild
                } else {
                    break
                }
                if rightChild < index && xx[rightChild] > xx[maxChild] {
                    maxChild = rightChild
                }
                guard xx[maxChild] > xx[parent] else { break }

                xx.swapAt(parent, maxChild)
                parent = maxChild
                leftChild = parent.leftChild
                rightChild = parent.rightChild
            }
        }
    }
    
    // https://ru.wikipedia.org/wiki/Быстрая_сортировка
    
    // NOTE: вариант из книжки "Грокаем алгоритмы"
    public static func quick(_ xx: [Element]) -> [Element] {
        guard xx.count > 1 else { return xx }
        guard xx.count > 2 else {
            return xx[0] > xx[1] ? [xx[1], xx[0]] : xx
        }
        
        var xx = xx
        let pivot = xx.popLast()!
        var left = [Element](), right = [Element]()
        
        for x in xx {
            if x < pivot {
                left.append(x)
            } else {
                right.append(x)
            }
        }

        return quick(left) + [pivot] + quick(right)
    }
    
    public static func quick1(_ xx: [Element]) -> [Element] {
        guard xx.count > 1 else { return xx }
        
        let high = xx.count - 1,  pivot = xx[high]
        var xx = xx, i = 0
        for j in 0..<high {
            if xx[j] <= pivot {
                xx.swapAt(i, j)
                i += 1
            }
        }
        xx.swapAt(i, high)
        
        return quick1(Array(xx[..<i])) + quick1(Array(xx[i...]))
    }
    
    // https://ru.wikipedia.org/wiki/Сортировка_слиянием
    
    public static func merge(_ xx: [Element]) -> [Element] {
        guard xx.count > 1 else { return xx }

        let (left, right) = (0, xx.count - 1)
        let mid = (left + right) / 2
        
        return _merge(merge(Array(xx[...mid])), merge(Array(xx[(mid + 1)...])))
    }
    
    private static func _merge(_ xx1: [Element], _ xx2: [Element]) -> [Element] {
        let (m, n) = (xx1.count, xx2.count)
        var (i, j) = (0, 0)
        var result = [Element]()
        while i < m && j < n {
            if xx1[i] < xx2[j] {
                result.append(xx1[i])
                i += 1
            } else {
                result.append(xx2[j])
                j += 1
            }
        }
        while i < m {
            result.append(xx1[i])
            i += 1
        }
        while j < n {
            result.append(xx2[j])
            j += 1
        }
        return result
    }
}

private extension Int {
    var parent: Int {
        (self - 1) / 2
    }

    var leftChild: Int {
        (self * 2) + 1
    }

    var rightChild: Int {
        (self * 2) + 2
    }
}
