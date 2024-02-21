#include<stdio.h>
int main()
    {
     int arr[100];
     int i,n;
     int sum=0;
     int mul=0;
     int sub=0;
     float div=0;
     printf("\n Enter size of array: ");
     scanf("%d",&n);
     printf("\n Enter array element: ");
     for(i=0;i<n;i++){
      // printf("\n Enter array element: ");
       scanf("%d",&arr[i]);
     }
     for(i=0;i<n;i++){
        sum = sum + arr[i];
//      mul = mul * arr[i];
//      div = div / arr[i];
//      sub = sub - arr[i];

     }
     printf("\n addition of array is = %d\n",sum);
  //   printf("multiplication of array is = %d\n",mul);
    // printf("division of array is = %f\n",div);
    // printf("subtraction of array is = %d\n",sub);


     return 0;
    }
