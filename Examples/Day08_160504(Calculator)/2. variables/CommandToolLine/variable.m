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
int totalScore=0;
int avgScore = 0;


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
    totalScore = korScore + mathScore + sciScore + engScore;
    
    return totalScore;
}

// avg score
int getAvgScore( )
{
    avgScore = totalScore/4;
    
    return avgScore;
}

int main(int argc, const char * argv[]) {

    setkoreanScore(90);
    setMathScore(80);
    setSciScore(98);
    setEngScore(79);
    
    printf("점수의 총점은 %d, 평균은 %d",getTotalScore(),getAvgScore());
    
    
    
    return 0;
}

