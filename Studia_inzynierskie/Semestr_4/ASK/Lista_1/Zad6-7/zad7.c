void insertion_sort(int arr[], int length)
{
    int j, temp;
    for (int i = 0; i < length; i++)
    {
        j = i;
        while (j > 0 && arr[j] < arr[j - 1])
        {
            temp = arr[j];
            arr[j] = arr[j - 1];
            arr[j - 1] = temp;
            j--;
        }
    }
}


        i:=0            <B1>
        goto ITest

ILoop:  j := i          <B2>

JTest1: if j>0 goto JTest2  <B3>
        goto IPlus

JTest2: t1 := j*4       <B4>
        t2 := arr[t1]
        t3 := j-1
        t4 := t3*4
        t5 := arr[t3]
        if t2 < t5 goto JLoop
        goto ITest

JLoop:  temp := arr[t1] <B5>
        arr[t1] := arr[t3]
        arr[t3] := temp
        j := j-1
        goto JTest1

IPlus:  i := i+1        <B6>

ITest:  if i<length goto ILoop <B7>


