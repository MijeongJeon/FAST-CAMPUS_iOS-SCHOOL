//
//  main.m
//  CommandToolLine
//
//  Created by Mijeong Jeon on 5/4/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

// declare variables
int korScore = 0;
int mathScore = 0;
int sciScore = 0;
int engScore = 0;


// input score
void setkoreanScore(int newScore)
{
    korScore = newScore;
}

void setMathScore(int newScore)
{
    mathScore = newScore;
}

void setSciScore(int newScore)
{
    sciScore = newScore;
}

void setEngScore(int newScore)
{
    engScore = newScore;
}


// total score
int getTotalScore()
{
    return korScore + mathScore + sciScore + engScore;
    
}

// avg score
float getAvgScore( )
{
    return (float)getTotalScore()/4;
    
}

int main(int argc, const char * argv[]) {
    
    setkoreanScore(90);
    setMathScore(80);
    setSciScore(98);
    setEngScore(79);
    
    printf("점수의 총점은 %d, 평균은 %f",getTotalScore(),getAvgScore());
    
    return 0;
}

