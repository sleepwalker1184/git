#include <fstream>
#include <math.h>
#include <ctype.h>
#include <cstdlib>
#include <cstring>
#include<string>
#include <iomanip>
#include <iostream>
using namespace std;
#include"fuc.h"


int main()
{
//    char *a={"a b 1 2 3 [ ]"};
//    char *a=new char[655];
//    cin.getline(a, Max, '#');
    using std::cout;
    cout.setf(std::ios::left);
    //int w=cout.width(10);
    char a[655];
    ifstream in;
    ofstream out;
    in.open("/Users/zhangalex/Desktop/demo/demo/1.txt");
    in.getline(a, 655, '#');
    int row = 1, line = 0;
    Table *table = new Table[Max];
    int x = strlen(a);
    scanner(a, x, table, row, line);
    out.open("/Users/zhangalex/Desktop/demo/demo/2.txt");
    for (int i = 0; i < TableNum; i++)
    {
//        cout.width(4);
        cout<<setw(4)<<i<<"\t";
//        cout.width(4);
        cout<<setw(4) << table[i].value <<"\t" ;
        if (table[i].list != 7)
        {
//            cout.width(4);
            cout <<setw(1)<< '(';table[i].list + ','+ table[i].value + ',' +table[i].listpos + ')';
            cout <<setw(1)<<table[i].list<<',';
            cout<<setw(5)<<table[i].value<<',';
            cout<<setw(1)<<table[i].listpos<<')'<<"\t\t";
        }
        else
        {
//            cout.width(4);
            cout<<setw(14) << "error" << "\t";
        }
        switch (table[i].list)
        {
            case 1:
            {
                cout.width(4);
                cout<< "关键字" << "  \t  "<< '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            case 2:
            {
//                cout.width(4);
                cout<<setw(6) << "界符" << "       "<< '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            case 3:
            {
//                cout.width(4);
                cout<<setw(6) << "算数运算符"<<"  " << '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            case 4:
            {
//                cout.width(4);
                cout<<setw(6) << "关系运算符"<<"  " << '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            case 5:
            {
//                cout.width(4);
                cout<<setw(6) << "标识符" << "  \t  "<< '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            case 6:
            {
//                cout.width(4);
                cout<<setw(6) << "常数" << "       "<< '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            case 7:
            {
//                cout.width(4);
                cout<<setw(6)<<"error"<<"\t  "<< '(' << table[i].row << ',' << table[i].line << ')';
//                cout ;
                break;
            }
            default:
                break;
        }
        cout << endl;
    }
}


