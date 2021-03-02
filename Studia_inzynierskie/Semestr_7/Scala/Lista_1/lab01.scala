object Lab01 {

    def scalarUgly(xs: List[Int], ys: List[Int]): Int = {
        var res = 0;
        var i = 0;
        val length = xs.length;
        
        while (i<length) {
            res = res + xs(i)*ys(i);
            i += 1;
        }

        return res;
    }

    def scalar(xs: List[Int], ys: List[Int]): Int = {
        val multList = for ((x,y) <- xs.zip(ys)) yield x*y;
        return multList.sum;
    }

    def sortUgly(xs: List[Int]): List[Int] = {
        if (xs.length <= 1)
            return xs;

        var smaller: List[Int] = List();
        var bigger: List[Int] = List();

        val pivot = xs(0);

        for (x <- xs.tail) {
            if (x <= pivot) {
                smaller = x::smaller;
            }
            else {
                bigger = x::bigger;
            }
        }

        return sortUgly(smaller) ++ (pivot::sortUgly(bigger));
    }

    def sort(xs: List[Int]): List[Int] = {
        if (xs.length <= 1)
            return xs;

        val pivot = xs(0);
        
        val smaller = for (x <- xs.tail if x <= pivot) yield x;
        var bigger = for (x <- xs.tail if x > pivot) yield x;

        return sort(smaller) ++ (pivot::sort(bigger));
    }

    def isPrimeUgly(n: Int): Boolean = {
        var i = 2;

        while (i*i <= n) {
            if (n%i == 0)
                return false;
            
            i+=1;
        }

        return true;
    }

    def isPrime(n: Int): Boolean = {
        
        val sqrt = math.sqrt(n.doubleValue()).ceil.intValue();

        for (i <- 2 to sqrt)
            if (n%i == 0) return false;

        return true;
    }

    def primePairsUgly(n : Int): List[(Int, Int)] = {
        var res: List[(Int, Int)] = List();
        var s: Int = 0;

        for (i <- 1 to n-1) {
            for (j <- i+1 to n) {
                s = i+j;
                if (isPrimeUgly(s))
                    res = res ++ List((i,j));
            }
        }

        return res;
    }

    def primePairs(n: Int): List[(Int, Int)] = {
        val res = for (i <- 1 to n-1; j <- i+1 to n if isPrime(i+j))
            yield (i,j);

        return res.toList;
    }


    def fileLinesUgly(file: java.io.File): List[String] = {
        import java.util.Scanner;

        var res: List[String] = List();
        var line: String = null;
        
        val reader: Scanner = new Scanner(file);
        while (reader.hasNextLine()) {
            line = reader.nextLine();
            res = res ++ List(line);
        }

        return res;
    }

    def fileLines(file: java.io.File): List[String] = {
        import scala.io.Source;

        return Source.fromFile(file).getLines.toList;
    }

    val filesHere = new java.io.File(".").listFiles
    def printNonEmptyUgly(pattern: String): Unit = {
        var file: java.io.File = null;
        var i = 0;
        val length = filesHere.length;
        val regex = pattern.r;

        while (i < length) {
            file = filesHere(i);

            file.getName() match {
                case regex(_*) => println(file.getName())
                case _ => ()
            }

            i+=1;
        }
    }

    def printNonEmpty(pattern: String): Unit = {

        val regex = pattern.r;

        for (file <- filesHere) {
            file.getName() match {
                case regex(_*) => println(file.getName())
                case _ => ()
            }
        }
    }

    def main(args: Array[String]): Unit = {
        for (line <- fileLinesUgly(filesHere(1))) {
            println(line);
        }
    }
}