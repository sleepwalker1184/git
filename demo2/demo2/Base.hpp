//
//  Base.hpp
//  demo2
//
//  Created by zhang Alex on 2017/10/23.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#ifndef Base_hpp
#define Base_hpp

#include <iostream>
#include <string>
#include <cstring>
#include <vector>
#include <string>
#include <set>
#include <algorithm>
#include <iomanip>
#include <map>
#include <cmath>
#include <stack>
using namespace std;

struct node
{
    char left;
    string right;
    //    int n;
};

class Base
{
protected:
    int T;
    node analy_str[100]; //inputstring
    
    set<char> first_set[100];//first
    set<char> follow_set[100];//follow
    vector<char> ter_copy;//vt except $
    vector<char> ter_colt;//vt
    vector<char> non_colt;//vn
    
public:
    Base() :T(0){}
    bool isNotSymbol(char c);  //vn true vt false
    int get_index(char target);//vt num
    int get_nindex(char target);//vn num
    void get_first(char target);
    void get_follow(char target);
    void inputAndSolve();
    void display();//output
    
};


#endif /* Base_hpp */

