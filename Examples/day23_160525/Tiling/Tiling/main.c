//
//  main.c
//  Tiling
//
//  Created by Mijeong Jeon on 5/25/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>
//**************** 2x1 ***************//
/*
int main(int argc, const char * argv[]) {

    int n;
    scanf("%d",&n);
    int count[1000];
    count[1]=1;
    count[2]=2;
    
    for (int i=3; i<=n; i++) {
        count[i] = (count[i-1]%10007+count[i-2]%10007)%10007;
    }
    
    printf("%d\n",count[n]);
    
    return 0;
}
*/

//**************** 2x2, 2X1 ***************//

int main(int argc, const char * argv[]) {
    int n;
    scanf("%d",&n);
    int count[1000];
    count[1]=1;
    count[2]=3;
    
    for (int i=3; i<=n; i++) {
        count[i] = (count[i-1]%10007+count[i-2]*2%10007)%10007;
    }
    
    printf("%d\n",count[n]);

    
    return 0;
}
