---
layout: post
title: "C++ - Int Class 範例"
description: "重新定義 int 成新的類別 Int ，以及 operator 的操作。"
date: 2018-09-18 18:00:00+0800
categories: [cpp]
tags:
  - cpp
author: kisaku
image:
comments: true
---
範例程式：
```vim
#include <iostream>
#include <cstring>
#include <cstdio>
using namespace std;
class Int {
  public:
    // for devlare
    Int(const int _d){ data=_d; }
    // for value to give
    Int& operator = (const int _d){
	    data=_d; 
	    return *this; 
    }
    void info(void){
	    cout << data << "\n"; 
    }
    int val(void){
      return data;
    }
  private: 
    int data; 
};
ostream& operator<<(ostream& os_, Int& d_)
{
  return os_ << d_.val();
}
int main(int argc, char *argv[]){
  Int i=5;
  i.info();
  i=6; 
  i.info();
  cout << i.val() << "\n"; 
  return 0; 
}
```
