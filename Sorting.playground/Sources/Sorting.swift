public struct Sorting<Element: Comparable> {
    
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
    
    // NOTE: https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%D0%BC%D0%B8
    
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

    // NOTE: https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0_%D0%A8%D0%B5%D0%BB%D0%BB%D0%B0
    
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
}
