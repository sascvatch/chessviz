#include<stdio.h>
int main() {
  int i=0, j=0;
  printf("Pered vamii - shahmatnaya doska:\n");
char **a;
a = new char *[8];
  for (i=1; i<=8; i++){
	a[i] = new char[8];
	

    for (j=1; j<=8; j++) {
      if(i==2) a[i][j]='P';
	else if(i == 7) a[i][j]='p';
	else a[i][j] = ' ';
    }


  }
  for (i=1; i<=8; i++){
	 for (j=1; j<=8; j++) 
	printf("%c", a[i][j]);
	printf("\n");
}
}

