#include <cstdio>
#include <cstdlib>
#include <ctime>





static int partition(int l, int r, int arr[]) {
    long pivot = arr[(l + r) / 2];
    while (l <= r) {
        while (arr[r] > pivot)
            r--;
        while (arr[l] < pivot)
            l++;
        if (l <= r) {
            long tmp = arr[r];
            arr[r] = arr[l];
            arr[l] = tmp;
            l++;
            r--;
        }
    }
    return l;
}

int findNextR(int l,int size, int arr[]) {
    for (int i = l; i < size; i++) {
        if (arr[i] < 0)
            return i;
    }
    return size - 1;
}

void print_arr(int arr[], int n)
{
    for (int i=0; i<n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void quickSort(int size, int arr[]) {
    int l = 0;
    int r = size - 1;
    int p = 0;
    int i = 0;
    while (true) {
        i--;
        while (l < r) {
            p = partition(l, r, arr);
            arr[r] = -arr[r];
            r = p - 1;
            i++;
        }
        print_arr(arr, size);
        if (i < 0)
            break;
        l++;
        r = findNextR(l, size, arr);
        arr[r] = -arr[r];
        print_arr(arr,size);
        printf("%d %d\n", l, r);
        printf("\n");
    }
    if (arr[size-1]<0) arr[size-1]*=-1;
}

int main()
{
    srand(time(NULL));


    int T[6] = {5,3,7,1,4,2};
    int k = partition(0,5,T);

    quickSort(6,T);

    print_arr(T,6);

    return 0;
}