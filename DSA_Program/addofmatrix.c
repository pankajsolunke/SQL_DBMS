#include<stdio.h>
int main()
    {
      int i,j,f[3][3],s[3][3],sum[3][3];
//      printf("Enter the first matrix element:-\n");
      for(i=0;i<3;i++){
        for(j=0;j<3;j++){
          printf("enter the first matrix element:[%d][%d]",i,j);
          scanf("%d",&f[i][j]);
        }
      }
//      printf("Enter the second matrix element:-\n");
      for(i=0;i<3;i++){
        for(j=0;j<3;j++){
          printf("enter the second matrix element:[%d][%d]",i,j);
          scanf("%d",&s[i][j]);
        }
      }
      printf("addition of matrix\n");
      for(i=0;i<3;i++){
        for(j=0;j<3;j++){
          sum[i][j]=f[i][j]+s[i][j];
          printf("%d\t",sum[i][j]);
        }
      printf("\n");
      }
 //  printf("\n");
 }
