//
//  exp.cpp
//  demo2
//
//  Created by zhang Alex on 2017/10/23.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#include "exp.hpp"


void exp::preexcute()
{
    int i=0;
    int k=2;
    analy_string[0].left='Z';
    analy_string[0].right=analy_str[0].left;
    analy_string[0].dot=0;
    analy_string[0].expect="#";
    analy_string[1].left='Z';
    analy_string[1].right=analy_str[0].left;
    analy_string[1].dot=1;
    while(isalpha(analy_str[i].left))
    {
        for(int j=0;j<=analy_str[i].right.length();j++)
        {
            analy_string[k].left=analy_str[i].left;
            analy_string[k].right=analy_str[i].right;
            analy_string[k].dot=j;
            k++;
        }
        i++;
    }
    analy_set[0].node[0]=analy_string[0];
    analy_set[0].n=1;
}


void exp::display()
{
    ofstream out;
    out.open("/Users/zhangalex/Desktop/git/demo2/2.txt");
    int i=0;
    while(analy_set[i].n>0)
    {
        out<<"set"<<i<<"\n";
        for(int j=0;j<analy_set[i].n;j++)
        {
            out<<analy_set[i].node[j].left<<"\t";
            out<<analy_set[i].node[j].right<<"\t";
            out<<analy_set[i].node[j].dot<<"\t";
            out<<analy_set[i].node[j].expect<<"\t";
            for(int k=0;k<analy_set[i].Listsign.turnnum;k++)
            {
                out<<analy_set[i].Listsign.turnalpha[k]<<"\t";
                out<<analy_set[i].Listsign.turninto[k]<<"\t";
            }
            out<<"\n";
        }
        out<<"\n";
        i++;
    }
    
}

bool exp::judgehelp(bool a[],int n)
{
    for(int i=0;i<n;i++)
    {
        if(a[i]==false)
            return false;
    }
    return true;
}

string exp::CLOSUREexpect(char x1, string x2)
{
    string ret;
    if(x1=='$')
        ret=x2[0];
    else
        if(!(x1>'A'&&x1<'Z'))
            ret=x1;
        else
        {
            int i=0;
            set<char>::iterator it;
            for(it=first_set[get_index(x1)].begin();it!=first_set[get_index(x1)].end();it++)
            {
                i++;
            }
            ret.resize(i);
            i=0;
            for(it=first_set[get_index(x1)].begin();it!=first_set[get_index(x1)].end();it++)
            {
                ret[i]=*it;
                i++;
            }
        }
    return ret;
}

bool exp::judgealpha(char x)
{
    if(x>='A'&&x<='Z')
        return true;
    else
        return false;
}

void exp::CLOSURE(lr1set &x)
{
    int n=-1;
    int i=0;
    while(x.n!=n)
    {
        n=x.n;
        while(judgealpha(x.node[i].left))
        {
            int k=0;
            if(x.node[i].right[x.node[i].dot]>='A'&&x.node[i].right[x.node[i].dot]<='Z')
            {
                while(isalpha(analy_string[k].left))
                {
                    if(analy_string[k].left==x.node[i].right[x.node[i].dot]&&analy_string[k].dot==0)
                    {
                        x.node[x.n].left=x.node[i].right[x.node[i].dot];
                        x.node[x.n].right=analy_string[k].right;
                        x.node[x.n].dot=0;
                        if(x.node[i].right[x.node[i].dot+1]!='\0')
                            x.node[x.n].expect=CLOSUREexpect(x.node[i].right[x.node[i].dot+1],x.node[i].expect);
                        else
                            x.node[x.n].expect=x.node[i].expect;
                        bool flag=0;
                        for(int l=0;l<x.n;l++)
                        {
                            flag=false;
                            if(x.node[l].left==x.node[x.n].left&&
                               x.node[l].right==x.node[x.n].right&&
                               x.node[l].expect==x.node[x.n].expect&&
                               x.node[l].dot==x.node[x.n].dot)
                            {
                                flag=true;
                                break;
                            }
                        }
                        if(!flag)
                            x.n++;
                    }
                    
                    
                    k++;
                }
            }
            i++;
        }
    }
}

int exp::Judege(lr1set suspect,int currentsetnum)
{
    bool flag[suspect.n];
    for(int i=0;i<suspect.n;i++)
        flag[i]=true;
    for(int i=0;i<currentsetnum;i++)
    {
            for(int j=0;j<suspect.n;j++)
            {
                for(int k=0;k<analy_set[i].n;k++)
                {
                    flag[j]=false;
                    if(suspect.node[j].right==analy_set[i].node[k].right&&
                       suspect.node[j].left==analy_set[i].node[k].left&&
                       suspect.node[j].dot==analy_set[i].node[k].dot&&
                       suspect.node[j].expect==analy_set[i].node[k].expect)
                    {
                        flag[j]=true;
                        break;
                    }
                }
            }
        if(judgehelp(flag,suspect.n))
            return i;
    }
    return 0;
}


lr1set exp::GOTO(lr1set &origin,char turn,int currentnum)
{
    int k=0;
    lr1set tmpset;
    for(int i=0;i<origin.n;i++)
    {
        if(origin.node[i].right[origin.node[i].dot]==turn)
        {
            tmpset.node[k].left=origin.node[i].left;
            tmpset.node[k].right=origin.node[i].right;
            tmpset.node[k].dot=origin.node[i].dot+1;
            tmpset.node[k].expect=origin.node[i].expect;
            tmpset.n++;
            k++;
        }
    }
    return tmpset;
}



void exp::MainControl()
{
    CLOSURE(analy_set[0]);
    int currentsetnum=1;
//    int changenum=0;
    lr1set tmpset;
//    while(currentsetnum!=changenum)
//    {
//        changenum=currentsetnum;
        for(int l=0;l<currentsetnum;l++)
        {
            for(int i=0;i<ter_copy.size();i++)
            {
                if(ter_copy[i]!='#')
                {
                    analy_set[currentsetnum]=GOTO(analy_set[l], ter_copy[i],currentsetnum);
                    if(analy_set[currentsetnum].n>0)
                    {
                        CLOSURE(analy_set[currentsetnum]);
                        int temp=Judege(analy_set[currentsetnum], currentsetnum);
                        analy_set[l].Listsign.turnalpha[analy_set[l].Listsign.turnnum]=ter_copy[i];
                        if(temp!=0)
                            analy_set[l].Listsign.turninto[analy_set[l].Listsign.turnnum]=temp;
                        else
                            analy_set[l].Listsign.turninto[analy_set[l].Listsign.turnnum]=currentsetnum;
                        analy_set[l].Listsign.turnnum++;
                        if(temp==0)
                        {
                            currentsetnum++;
                        }
                    }
                }
            }
            for(int i=0;i<non_colt.size();i++)
            {
                analy_set[currentsetnum]=GOTO(analy_set[l], non_colt[i],currentsetnum);
                if(analy_set[currentsetnum].n>0)
                {
                    CLOSURE(analy_set[currentsetnum]);
                    int temp=Judege(analy_set[currentsetnum], currentsetnum);
                    analy_set[l].Listsign.turnalpha[analy_set[l].Listsign.turnnum]=non_colt[i];
                    if(temp!=0)
                        analy_set[l].Listsign.turninto[analy_set[l].Listsign.turnnum]=temp;
                    else
                        analy_set[l].Listsign.turninto[analy_set[l].Listsign.turnnum]=currentsetnum;
                    analy_set[l].Listsign.turnnum++;
                    if(temp==0)
                    {
                        
                        currentsetnum++;
                    }
                }
            }
        }
//    }
}

int exp::locate(char x, string y)
{
    int i=0;
    while(isalpha(analy_str[i].left))
    {
        if(analy_str[i].left==x&&analy_str[i].right==y)
            return i;
        i++;
    }
    return -1;
}



void exp::lr1list()
{
    for(int i=0;i<20;i++)
    {
        for(int j=0;j<20;j++)
            analy_list[i][j]=0;
    }
    int i=0;
    while(analy_set[i].n>0)
    {
        for(int j=0;j<analy_set[j].n;j++)
        {
            if(analy_set[i].node[j].dot==analy_set[i].node[j].right.length())
            {
                for(int k=0;k<analy_set[i].node[j].expect.length();k++)
                {
                    analy_list[i][get_nindex(analy_set[i].node[j].expect[k])]=-(locate(analy_set[i].node[j].left, analy_set[i].node[j].right)+1);
                }
                
            }
        }
        i++;
    }
    i=0;
    while(analy_set[i].n>0)
    {
        if(analy_set[i].node[0].left=='Z'&&analy_set[i].node[0].dot==1)
            analy_list[i][get_nindex('#')]=-999;
            for(int j=0;j<analy_set[i].Listsign.turnnum;j++)
            {
                if(get_nindex(analy_set[i].Listsign.turnalpha[j])!=-1)
                {
                    analy_list[i][get_nindex(analy_set[i].Listsign.turnalpha[j])]=analy_set[i].Listsign.turninto[j];
                }
                else
                {
                    analy_list[i][get_index(analy_set[i].Listsign.turnalpha[j])+ter_copy.size()]=analy_set[i].Listsign.turninto[j];
                }
            }
        i++;
    }
    
    for(int i=0;i<12;i++)
    {
        cout<<i<<"\t";
        for(int j=0;j<5;j++)
            cout<<analy_list[i][j]<<" ";
        cout<<"\n";
    }
}





