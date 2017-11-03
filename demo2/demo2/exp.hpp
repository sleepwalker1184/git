//
//  exp.hpp
//  demo2
//
//  Created by zhang Alex on 2017/10/23.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#ifndef exp_hpp
#define exp_hpp
#include "Base.hpp"
struct lr1node
{
    char left;
    string right;
    int dot;
    string expect;
};

struct listsign
{
    char turnalpha[10];
    int turninto[10];
    int turnnum=0;
};

struct lr1set
{
    lr1node node[30];
    int n=0;
    listsign Listsign;
};

class exp:public Base
{
public:
    void preexcute();
    void display();
    void CLOSURE(lr1set &x);
    lr1set GOTO(lr1set &origin,char turn,int currentnum);
    void finalanaly(string toanaly);
    void MainControl();
    void lr1list();
    void listdisplay();
    int Judege(lr1set suspect,int currentsetnum);
    bool judgealpha(char x);
    bool judegturn(lr1set x,int n);
    int locate(char x,string y);
    string CLOSUREexpect(char x1,string x2);
    bool judgehelp(bool a[],int n);
    
protected:
    lr1node analy_string[100];
    lr1set analy_set[30];
    int analy_list[40][20];
};

#endif /* exp_hpp */
