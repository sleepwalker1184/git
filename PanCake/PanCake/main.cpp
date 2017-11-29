//
//  main.cpp
//  PanCake
//
//  Created by zhang Alex on 2017/11/29.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#include <iostream>
using namespace std;




class sorting
{
private:
    int * m_CakeArray;
    int m_nCakeCnt;
    int m_nMaxSwap;
    
    int * m_SwapArray;
    
    int * m_ReverseCakeArray;
    int * m_ReverseCakeArraySwap;
    int  m_nSearch;
public:
    void run(int * pCakeArray,int nCakeCnt)
    {
        Init(pCakeArray,nCakeCnt);
        
        m_nSearch=0;
        search(0);
    }
    void out()
    {
        for(int i=0;i<m_nMaxSwap;i++)
        {
            cout<<m_SwapArray[i]<<" ";
        }
        cout<<"\n";
        cout<<"search times "<<m_nSearch<<"\n";
        cout<<"total swap times "<<m_nMaxSwap<<"\n";
    }
    void Init(int *pCakeArray,int nCakeCnt)
    {
        m_nCakeCnt=nCakeCnt;
        m_CakeArray=new int[m_nCakeCnt];
        for(int i=0;i<m_nCakeCnt;i++)
        {
            m_CakeArray[i]=pCakeArray[i];
        }
        for(int i=0;i<m_nCakeCnt;i++)
        {
            cout<<m_CakeArray[i];
        }
        m_nMaxSwap=UpperBound(m_nCakeCnt);
        m_SwapArray=new int[m_nMaxSwap+1];
        
        m_ReverseCakeArray=new int[m_nCakeCnt];
        for(int i=0;i<m_nCakeCnt;i++)
        {
            m_ReverseCakeArray[i]=m_CakeArray[i];
        }
        
        m_ReverseCakeArraySwap=new int[m_nCakeCnt];
    }
    
    int LowerBound(int *pCakeArray,int nCakecnt)
    {
        int t,ret=0;
        for(int i=1;i<nCakecnt;i++)
        {
            t=pCakeArray[i]-pCakeArray[i-1];
            if(t==1||t==-1)
            {
                
            }
            else
            {
                ret++;
            }
        }
        return ret;
    }
    
    void search(int step)
    {
        int i,nEastmate;
        m_nSearch++;
        
        nEastmate =LowerBound(m_ReverseCakeArray, m_nCakeCnt);
        if(step+nEastmate>m_nMaxSwap)
            return;
        if(IsSorted(m_ReverseCakeArray,m_nCakeCnt))
        {
            if(step<m_nMaxSwap)
            {
                m_nMaxSwap=step;
                for(int i=0;i<m_nMaxSwap;i++)
                    m_SwapArray[i]=m_ReverseCakeArraySwap[i];
            }
            return;
        }
        
        for(i=1;i<m_nCakeCnt;i++)
        {
            Reverse(0,i);
            m_ReverseCakeArraySwap[step]=i;
            search(step+1);
            Reverse(0,i);
        }
    }
    
    bool IsSorted(int *pCakeArray,int nCakeCnt)
    {
        for(int i=1;i<nCakeCnt;i++)
        {
            if(pCakeArray[i-1]>pCakeArray[i])
                return false;
        }
        return true;
    }
    
    void Reverse(int begin,int end)
    {
        int i,j,t;
        for(i=begin,j=end;i<j;i++,j--)
        {
            t=m_ReverseCakeArray[i];
            m_ReverseCakeArray[i]=m_ReverseCakeArray[j];
            m_ReverseCakeArray[j]=t;
        }
    }
    int UpperBound(int n)
    {
        return n*2;
    }
    
    sorting()
    {
        m_nCakeCnt=0;
        m_nMaxSwap=0;
    }
    ~sorting()
    {
        
    }
};
int main(int argc, const char * argv[]) {
    sorting x;
    int *input,num;
    cin>>num;
    input=new int[num];
    for(int i=0;i<num;i++)
        cin>>input[i];
//    for(int i=0;i<num;i++)
//        cout<<input[i];
    x.run(input, num);
    x.out();
    return 0;
}
