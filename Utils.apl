#!/usr/local/bin/apl --script
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝
⍝ Utils 2016-02-07 05:15:39 (GMT-6)
⍝
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇z←d AddDays n 
 z←CAL n+JUL d
∇

∇Ail ln;s;q                       
 →(1=ln←⌈ln)/LP1
 ○(6↑'[',(⍕ln-1),']'),Mat[ln-1;]
 LP1:→(0=⍴q←Eoi 6↑'[',(⍕ln),']')/0
 →((1↓⍴Mat)=s←(⍴q)⌈1↓⍴Mat)/EN1
 Mat←((1↑⍴Mat),s)↑Mat
 EN1:Mat←(ln≠⍳1+1↑⍴Mat)⍀Mat
 Mat[ln;]←s↑q
 ln←ln+1
 →LP1
∇

∇z←Aln t;i;n                                                            
 z←((⍴n)⍴(,(-+/∧\⌽i)⌽i)\(,i←n≠' ')/,n←'[',(⍕(n,1)⍴¯1+⍳n←1↑⍴t),']'),' ',t
 ⍝ t = ⎕CR of a function
 ⍝ z = t with line numbers in brackets added
∇

∇Auto;Pn;Lu;Lib;Dn;Fm;Fv;Delim;Cms;Pad;Pt
 →(1=⍴⎕LC)/⎕LC[1]+2
 →0,0⍴⎕←'State indicator must be lowered.'
 ⎕LX←'Auto',0⍴⎕EX'FILE_IO',0⍴⎕EX'SQL'
 ⎕PW←132
 Delim←,':' ◊ Cms←'' ◊ Pad←'  '
 Lu←1
 Lib←⍬
 Dn←0
 ⍝ Pn←0 0
 ⍝ Enter
 start
 Lib←0⍴⎕EX'FILE_IO',0⍴⎕EX'SQL'
∇

∇z←Box x    
 z←⊂(⍴x)(,x)
∇

∇z←CAL d;y                                                                        
 z←⌊(d-⌊365.25×y←⌊((d←,d)-122.1)÷365.25)÷30.6001
 z←100 100 100⊥⍉(y+∨/z∘.=1 2),(z←z-1+12×∨/z∘.=14 15),[1.5]d-(⌊365.25×y)+⌊30.6001×z
∇

∇z←CCJ a                        
 z←(⌈0.5×(+/∧\z)-+/∧\⌽z←' '=a)⌽a
∇

∇z←n CJ x                                                  
 z←((0⌈⌊0.5×n-⍴x)⍴' '),x←(¯1+(x≠' ')⍳1)↓(-((⌽x≠' ')⍳1)-1)↓x
∇

∇z←CS x                           
 z←(¯1+(' '≠x)⍳1)↓(1-(' '≠⌽x)⍳1)↓x
∇

∇z←CSV∆Parse v;y;d;q                                                                                                                                                 
 d←','
 q←'"'
 ⍝ Break apart columns into separate arrays
 ⍝ z←1↓1↓¨(1++\(z∊d)>≠\z∊q)⊂z←(1↑d),(1↑d),v
 ⍝ Or, break apart columns into separate arrays, normalize embedded quotes, and remove surrounding quotes
 z←{((⍴⍵)⍴y,((0⌈¯2+⍴⍵)⍴1),y←~((¯1↑⍵)∊q)∧((1↑⍵)∊q)∧1<⍴⍵)/⍵←(-y)↓(⍲/(¯1+⍳⍴⍵)⌽(0 ¯1↓0,0 1↓(((⍴⍵)⍴q)∘.=⍵)),0)/⍵←⍵,(y←1=⍴,⍵)⍴' '}¨z←1↓1↓¨(1++\(z∊d)>≠\z∊q)⊂z←(1↑d),(1↑d),v
∇

∇z←CSV∆dequote a;y;q                                                
 q←'"'
 ⍝ remove embedded quotes from a string
 z←(-y)↓(⍲/(¯1+⍳⍴z)⌽(0 ¯1↓0,0 1↓(((⍴z)⍴q)∘.=z)),0)/z←a,(y←1=⍴,a)⍴' '
 ⍝ remove surrounding quotes
 z←((⍴z)⍴y,((0⌈¯2+⍴z)⍴1),y←~(q=¯1↑z)∧(q=1↑z)∧1<⍴z)/z
∇

∇z←L Catc R                                               
 z←((z,1↓⍴L)↑L),((z←(1↑⍴L←2 Rank L)⌈1↑⍴R),1↓⍴R)↑R←2 Rank R
∇

∇z←L Catr R                                                 
 z←(((1↑⍴L),z)↑L)⍪((1↑⍴R),z←(1↓⍴L←2 Rank L)⌈1↓⍴R)↑R←2 Rank R
∇

∇Change;L;s;q                                                                     
 →(0=1↑⍴Mat)/ER1
 EN1:→(EHN L←(1 ¯1,⍳1↑⍴Mat)Piv'Enter the line numbers you wish to change')/0,EN1,0
 LP1:→(0=⍴L)/END
 q←Edit Mat[''⍴L;]
 →((1↓⍴Mat)=s←(⍴q)⌈1↓⍴Mat)/EN2
 Mat←((1↑⍴Mat),s)↑Mat
 EN2:Mat[1↑L;]←s↑q
 L←1↓L
 →LP1
 END:Mat←RS Mat
 →0
 ER1: ER'There are no lines to change.'
∇

∇Clear              
 ⍞←(⎕UCS 27),'[2J'
 ⍞←(⎕UCS 27),'[1;1H'
∇

∇z←b Convt n                    
 z←⍉((1+⌊(⍟(0=z)+z←⌈/n)÷⍟b)⍴b)⊤n
 ⍝ b = base
 ⍝ n = vector of decimal numbers
 ⍝ z = number n in base b
∇

∇z←m Ctit t                                                           
 ⍝ Create column title
 ⍝ Left argument is the format mask.  Each element seperated by comma
 ⍝ Right argument is one line of the column titles seperated by commas
 m←(((1↑⍴m)×⌈(1↑⍴t←','Parse t)÷+/'B'≠m[;1]),1↓⍴m)⍴m←','Parse m
 z←''
 LP1:→(0=⍴t)/0
 ⍎('B'=m[1;1])/'z←z,(⍎1↓m[1;])⍴'' '''
 ⍎('L'=m[1;1])/'z←z,(⍎1↓m[1;])↑t[1;]'
 ⍎('R'=m[1;1])/'z←z,(-⍎1↓m[1;])↑CS t[1;]'
 ⍎('C'=m[1;1])/'z←z,(⍎1↓m[1;])↑(⍎1↓m[1;])CJ t[1;]'
 ⍎('B'≠m[1;1])/'t←1 0↓t'
 m←1 0↓m
 →LP1
∇

∇ts←DATETIME                                                  
 ts←⎕TS
 ts←(10000⊥(ts[1]),100⊥ts[2 3]),100⊥ts[4 5]
 ts←ts,1+ts[2]≥1200
 ts[2]←ts[2]-1200×ts[2]>1300
 ts[2]←ts[2]+1200×ts[2]<100
 ts←(,Dtfmt ts[1]),'   ',(,Tmfmt ts[2]),(2 3⍴' AM PM')[ts[3];]
∇

∇z←n DIV d       
 z←(n×z)÷d+~z←d≠0
∇

∇z←Date;t                                                                  
 t←(4 2⍴'thstndrd')[1+t×(~z[3]∊11 12 13)∧(t←10⊤(z←⎕TS)[3])∊⍳3;]
 z←(Dyofwk 10000 100 100⊥z[⍳3]),'  ',(Mmofyr z[2]),' ',(⍕z[3]),t,', ',⍕z[1]
∇

∇Delete;L                                                                          
 →(0=1↑⍴Mat)/ER1
 EN1:→(EHN L←(1,(1↑⍴Mat),1 0 100)Pin'Enter the line numbers to be deleted')/0,EN1,0
 Mat←(~(⍳1↑⍴Mat)∊L)⌿Mat
 O'Line numbers ',(,⍕L),' have been deleted.'
 →0
 ER1:ER 'There are no lines to delete.'
∇

∇z←Dtfmt d                                                           
 z←(2 0⍕⍉d[,2;]),'/',(2 0⍕⍉d[,3;]),'/',4 0⍕⍉(d←10000 100 100⊤,d)[,1;]
 z←z[;1],(0 ¯1+⍴z)⍴¯1 0↓(d=' ')⊖(d←,0 1↓z),[0.5]'0'
∇

∇z←Dyofwk x                                                                                            
 z←RS(','Parse'Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday')[((⍳1<⍴,x)×⍴x)⍴x←1+7|5+JUL x;]
∇

∇z←EHN v                               
 z←((2 8↑2 4⍴'end help')∧.=8↑v),0=⍴v←,v
∇

∇z←ER p                                                           
 ⎕←⎕AV[8],'***  ',p,'  ***'
 z←0 0⍴0
 →(0=⍴Cms)/0
 z←ER 'Error in command string; returning to manual input.',Cms←''
∇

∇z←Ealn t;i;n                                                    
 z←((⍴n)⍴(,(-+/∧\⌽i)⌽i)\(,i←n≠' ')/,n←'[',(⍕(n,1)⍴⍳n←1↑⍴t),']'),t
 ⍝ t = ⎕CR of a function
 ⍝ z = t with line numbers in brackets added
∇

∇z←Edit x;p;t;r;s;n;b                                             
 z←x
 p←0
 LP1:⎕←z
 →(EHN CS t←,⍞,0⍴⍞←p⍴' ')/END,HP,0
 →((1↑CS t)∊',/')/EN1
 →(~(t← CS t)∊' 0123456789')/EN0
 p←0⌈¯1+⎕PW⌊⍎(t≠' ')/t
 →LP1
 EN0:p←0⌈¯1+(p≤⍴z)×p←(∧/(¯1+⍳⍴,t)⊖z∘.=t)⍳1
 →LP1
 EN1:p←0
 z←('/'≠(⍴z)↑(t⍳',')↑t)/z
 →((','∊t)∧0=s←⍴r←(t⍳',')↓t←((t≠'/')∨~∧\','≠t)/t)/EN2
 z←((n⍴1),((s+b-n)⍴0),((⍴z)-n←(⍴z)⌊b←¯1+t⍳',')⍴1)\z
 z[((','∊t)×¯1+t⍳',')+⍳s]←r
 →LP1
 EN2:z←RS z,(⍴z)↓⍞,0⍴⍞←z
 →0
 END:z←RS x
 →0
 HP:''
 'Enter  /  under characters you wish to delete.'
 'Enter  ,  under the character you wish to insert before.'
 'Enter text you wish to insert after the first ,'
 'Enter ''end'' to leave without changing the line.'
 'Enter an empty ''Enter'' to leave the edit.'
 'Enter a number to tab out to a column.'
 'Enter text not preceeded by , to tab to that text.'
 'Enter , not followed by anything to add to the end of the line.'
 ''
 →LP1
∇

∇z←Eoi p                      
 EN0:z←((⍴Pad)+⍴p)↓⍞,0⍴⍞←p,Pad
 →(':'≠1↑z)/0
 z←1↓z
 ⍎(∧/' '=z)/'→0,0⍴z←''  '''
 →('t'≠1↑z)/EN1
 →((0,PW,1 0 1)Lck 3↑1↓z)/EN0
 z←((⍎3↑1↓z)↑' '),LJ 3↓z
 →0
 EN1:→('c'≠1↑z)/0
 z←⎕PW CJ 1↓z
∇

∇z←m Err b   
 →(~z←∨/,b)/0
 b←ER m
∇

∇z←L Estart Mat;qq;fn;bv                                                  
 Delim←,'∵'
 qq←   'add       =  to add; insert; or write over a line,'
 qq←qq,'change    =  to modify a line in the current text,'
 qq←qq,'delete    =  to delete a group of lines,'
 qq←qq,'move      =  to move lines from one text to another,'
 qq←qq,'replace   =  to search and replace a character string,'
 qq←qq,'screen    =  to search and list text on a screen,'
 qq←qq,'list      =  to list the present text on paper,'
 qq←qq,'new       =  to erase the present text buffer'
 qq←','Parse qq
 z←Mat
 fn←'Add,Change,Delete,Move,Replace,Screen,List,New'
 fn←','Parse fn
 EN1:→(2↑bv←qq Pim'Enter your edit command')/EN2,END
 ⍎,(2↓bv)⌿fn
 →(L<⍴Mat)/ER1,ER2
 →EN1
 END:→(L<⍴Mat)/ER1,ER2
 z←Mat
 →0
 EN2:→(0∊⍴Mat)/EN3
 →('yn'Pic'Do you wish to return to your original text')/(3⍴EN2),0,EN3
 EN3:z←'end'
 →0
 ER1:→EN1 ∆ ER'Error; text has exceeded a maximum of ',(⍕1↑L),' lines.'
 ER2:→EN1 ∆ ER'Error; text has exceeded a maximum of ',(⍕¯1↑L),' columns.'
∇

∇z←a Expd v                                                      
 z←(,v∘.≥⍳z)/(z×⍴v)⍴(z⍴1),(z←⌈/v)⍴0
 →(0>a)/0
 z←((⍴z)×⌈a÷+/z)⍴z
 z←((+\z)⍳a)↑z←z,(0⌈a-+/z)⍴1
 ⍝ a = how many rows or columns you are going to expand
 ⍝ v = (how many to take),(how many blanks),(how many to take)...
 ⍝ z = binary vector - expand argument
∇

∇z←a Expnd v                                           
 z←(,v∘.≥⍳z)/,⍉((z←⌈/v),⍴v←1⌈|v)⍴0⌈×v
 →(0>a)/0
 z←((⍴z)×⌈a÷+/z)⍴z
 z←((+\z)⍳a)↑z←z,(0⌈a-+/z)⍴1
 ⍝ a = how many rows or columns you are going to expand
 ⍝ v = vector - expansion control
 ⍝              positive integer = number of ones
 ⍝              negative integer = number of zeros
 ⍝              0 = the same as ¯1
 ⍝ z = binary vector - expand argument
∇

∇z←f Fcj m                                         
 z←(⌈0.5×(+/∧\z)-+/∧\⌽z←' '=m)⌽m←(((2=⍴⍴m)⍴⍴m),f)↑m
∇

∇z←f Fld m           
 z←(((2=⍴⍴m)⍴⍴m),f)↑m
∇

∇z←f Flj m                                
 z←(¯1+⎕IO++/∧\m=' ')⌽m←(((2=⍴⍴m)⍴⍴m),f)↑m
∇

∇z←Fn                            
 z←⍕13 32 24 60 60⊥⎕TS[2 3 4 5 6]
∇

∇z←f Frj m                                  
 z←(-¯1+⎕IO++/∧\⌽m=' ')=m←(((2=⍴⍴m)⍴⍴m),f)↑m
∇

∇r←Iota v                            
 ⍎(3=⍴v←,v)/'→0,r←v[1]+v[2]×¯1+⍳v[3]'
 r←⍳v
 ⍝ v[1] = first number
 ⍝ v[2] = increments
 ⍝ v[3] = how many numbers
 ⍝ if 0=⍴v then ⍳v
∇

∇z←JUL d                                                                         
 z←(⌊365.25×(d[1;])-z)+(⌊30.6001×d[2;]+1+12×z←∨/d[2;]∘.=1 2)+(d←0 100 100⊤,d)[3;]
∇

∇r←LJ m                
 r←(¯1+⎕IO++/∧\m=' ')⌽m
∇

∇z←LS x                                                   
 ⍎'z←',((1=⍴⍴x)↑','),'(∨\'' ''∨.≠x)/x←((0,¯1↑⍴x)⍴'' '')⍪x'
∇

∇r←v Lck n                                                                    
 ⍝ n = string vector - to be tested
 ⍝ v[1] = minimum value
 ⍝ v[2] = max value
 ⍝ v[3] = numeric increment (1=integer)
 ⍝ v[4] = minimum number of numbers
 ⍝ v[5] = maximum number of numbers
 ⍝ r = 1 if any errors, 0 if good
 →(0=1↑0⍴n)/EN0
 →(r←(¯1↑(' '≠n)/n←,n)∊' ,')/EN1
 n[Omega','=n]←' '
 n[Omega'-'=n]←'¯'
 →(r←~∧/VI n)/EN1
 n←⍎n
 EN0: →(r←((⌊/n)<1↑v)∨v[2]<⌈/n)/EN2
 →(r←(v[3]≠0)∧∨/(⌊r)≠⌈r←n÷(v[3]=0)+v[3])/EN3
 →(~r←(v[4]>⍴,n)∨v[5]<⍴,n)/0
 →0 ∆ ER 'Error: You must enter ',(⍕v[4]),' to ',(⍕v[5]),' numbers; Re-enter.'
 EN1:→0 ∆ ER n,' is not numeric; Please re-enter.'
 EN2:→0 ∆ ER (⍕n),' is out of range; re-enter from ',(⍕1↑v),' to ',(⍕v[2]),'.'
 EN3:ER 'Error: Please re-enter in increments of ',(⍕v[3]),'.'
∇

∇t←Lcn n                      
 t←⌊/((~(⍳t)∊n)/⍳t),1+t←⌈/1,,n
∇

∇z←po Lhf f;b                                                                          
 ⍝ This function (along with Out and Rst) are used to print.
 z←1
 EN1:→(3↑b←'lpfs'Pic'Enter print destination: local, printer, file, or screen')/0,EN1,0
 Pd←((3↓b)/'LPFS'),f
 ∆dv←1 0
 →b[4 5 7]/EN2,LPR,EN3
 ⍎b[6]/'''File chosen: '',f'
 Pt←Pt,'?'
 →z←∆re←0
 EN2:→(EHN PI'Line up paper and press return.')/EN1,EN2,EN3
 EN3:→z←∆re←0
 →0
 LPR:OpenPrinter po
 z←0
∇

∇List;L;m                                                                       
 →(0=1↑⍴Mat)/ER1
 m←Ealn Mat
 EN1:→(EHN L←(1 ¯1,⍳1↑⍴Mat)Piv'Enter the line numbers you wish to list')/0,EN1,0
 2 1⍴' '
 m[L;]
 2 1⍴' '
 →0
 ER1:ER 'There are no lines to list.'
∇

∇z←w Lst m;t                                           
 z←((⌈t[1]÷z),z×t[2])⍴((z×⌈t[1]÷z←⌊w÷t[2]),(t←⍴m)[2])↑m
∇

∇z←Mmofyr i                                                                                                       
 z←RS(','Parse'January,February,March,April,May,June,July,August,September,October,November,December')[1+12|⌊i-1;]
∇

∇Move;m;fl;tl                                                                          
 →(0=1↑⍴m←Mat)/ER1
 EN1:→(EHN fl←(1,(1↑⍴m),1 0 10000)Pin'Enter the from line numbers')/0,HP1,0
 EN2:→(EHN tl←(0,(1↑⍴Mat),0.1 0 1)Pin'Enter the to line number')/EN1,HP2,EN1
 EN4:Mat←(~(⍳(⍴fl)+1↑⍴Mat)∊(tl←⌊tl)+⍳⍴fl)⍀Mat
 Mat[tl+⍳⍴fl;]←m[fl;]
 ○'The transfer is complete.'
 →0
 HP1:'Enter the line numbers you wish to move from the from text.'
 →EN1
 HP2:'Enter the line number in the present text after which the new lines will appear.'
 'or enter a number between two existing lines to insert at that point,'
 'or enter 0 to insert at the top.'
 →EN2
 ER1:ER'There are no lines in the present text to move.'
∇

∇z←a Mul c                                    
 ⍝ Make underline - companion function to Ctit
 a←','Parse a
 z←''
 LP1:→(0=⍴a)/0
 ⍎('B'=a[1;1])/'z←z,(⍎1↓a[1;])⍴'' '''
 ⍎('B'≠a[1;1])/'z←z,(⍎1↓a[1;])⍴c'
 a←1 0↓a
 →LP1
∇

∇New                                             
 →(0=⍴Mat)/0
 EN1:→('yn'Pic'clear present text')/0,EN1,0,EN2,0
 EN2:Mat←0 0⍴' '
∇

∇s←NumbStr n;d;name;count;ten;ten6;t                                                                   
 name←' ',','Parse',thousand,million,billion,trillion'
 count←' ',','Parse'one,two,three,four,five,six,seven,eight,nine'
 ten←' ',','Parse',twenty,thirty,forty,fifty,sixty,seventy,eighty,ninety'
 ten6←' ',','Parse'ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen,seventeen,eighteen,nineteen'
 →(0=⌊|n←''⍴n)/EN6
 s←(n<0)/'negative'
 d←''⍴1+⍴n←⌽((1+⌊(⍟n+n=0)÷⍟1000)⍴1000)⊤n←⌊|n
 LP1:→(0=d←d-1)/END
 →(n[d]=0)/LP1
 t←10 10 10⊤n[d]
 →(0=t[1])/EN2
 s←s,(RS count[t[1];]),' hundred'
 EN2:→(t[2]=1 0)/EN5,EN3
 s←s,RS ten[t[2];]
 EN3:→(0=t[3])/EN4
 s←s,RS count[t[3];]
 EN4:s←s,RS name[d;]
 →(0=+/(d-1)↑n)/LP1
 s←s,','
 →LP1
 EN5:s←s,RS ten6[1+t[3];]
 →EN4
 EN6:s←'zero'
 →0
 END:s←LS s
∇

∇O c             
 →(0=⎕NC'Pd')/EN1
 →('L'=1↑Pd)/0
 EN1:→(0≠⍴Cms)/0
 c
∇

∇z←Omega v                                                                        
 z←v/⍳⍴,v
 ⍝ convers a vector of 1's and 0's into a vector of the index positions of the 1's
∇

∇OpenPrinter options                             
 →(0≠⎕NC 'FILE_IO')/LOADED
 →('FILE_IO'≡'lib_file_io.so'⎕FX'FILE_IO')/LOADED
 ⎕ES 'Error loading FILE_IO library'
 LOADED:∆FH←'w'FILE_IO[24]'lpr ',options
∇

∇Out x;t                                                                                
 ⍝ This function (along with Lhs and Rst) are used to print.
 ⍝ This function takes a character scalar, vector, or matrix an prints it to the printer
 →('LSF'=1↑Pd)/EN1,EN1,EN1
 ⍎(2>⍴⍴x)/'x←(1,⍴,x)⍴x'
 LP1:→(0=1↑⍴x)/0
 t←((RS x[1;]),⎕AV[11])FILE_IO[23]∆FH
 x←1 0↓x
 →LP1
 EN1:x
∇

∇z←PI p;l;r                                    
 ⍎(0=⍴Cms)/'Cms←((⍴Pad)+⍴,p)↓l,0⍴l←⍞,0⍴⍞←p,Pad'
 Cms←(1+⍴z←(¯1+Cms⍳Delim[1])↑Cms)↓Cms
∇

∇r←d Parse v                                                        
 ⍝ Convert vector v into a matrix breaking at delimiter d
 r←(((0≠⍴v)×⍴r),⌈/r)⍴(,r∘.≥⍳⌈/r←¯1+(r,1+⍴v)-0,r←r/⍳⍴v)\(~r←v∈d)/v←,v
∇

∇r←d Parse2 v                                                      
 ⍝ break up vector v accoriding to delimiter d into seperate arrays
 r←1↓1↓¨(1++\r∊d)⊂r←(1↑d),(1↑d),v
∇

∇Pg;t                                              
 →(∆LN=0)/0
 →(0=t←66|63-∆LN)/EN1
 Out(t,1)⍴' '
 EN1:Out ⎕PW CJ'Page ',⍕∆PN←∆PN+1
 Out 2 1⍴' '
 ∆LN←0
 ⍎(('L'≠1↑Pd)∧0=10|∆PN)/'O''Completed page '',⍕∆PN'
∇

∇c←v Pis q                                                                     
 ⍝ input character string
 ⍝ v[1] = minimum number of characters
 ⍝ v[2] = maximum number of characters
 EN1:⍎'→(EHN c←',((¯1≠1↑v)/'CS '),'PI q,''?'')/0'
 →(~((⍴c)<1↑v)∨(⍴c)>1↓v)/0
 →EN1 ∆ ER 'Error: Please re-enter from ',(⍕0⌈1↑v),' to ',(⍕1↓v),' characters.'
∇

∇n←v Picd q;d;td                                                                                   
 ⍝ Date input - input format mm/dd/yyyy
 ⍝ v[1] = minimum date
 ⍝ v[2] = maximum date
 ⍝ v[3] = (optional) default value
 EN1:→((td≥v[1])∧v[2]≥td←10000 100 100⊥3↑⎕TS)/EN2
 →(EHN n←CS PI q,' [mm/dd/yyyy]?')/0,0,EN5
 →EN3
 EN2:→(EHN n←CS PI q,' or ''today'' [mm/dd/yyyy]?')/0,0,EN5
 →(∨/n≠(⍴n)↑'today')/EN3
 n←,Dtfmt 10000 100 100⊥3↑⎕TS
 EN3:→(~(d←d\(d←n≠'/')/n)∊' 0123456789')/ER1
 ⍎(1=⍴d←1↓⍎'0 ',d)/'d←,10000 100 100⊤d'
 →(3≠⍴d)/ER1
 →(0=+/v[1],d←10000 100 100⊥d[3 1 2])/EN4
 →(d≠CAL JUL d)/ER1
 →((d<v[1])∨v[2]<d)/ER2
 EN4:→0,n←d
 EN5:→(2=⍴v)/0
 →0,n←v[3]
 ER1:→EN1 ∆ ER n,' is not a valid date; example, for today: ',,Dtfmt 10000 100 100⊥3↑⎕TS
 ER2:→EN1 ∆ ER 'Error: Date is out of range; re-enter from ',(,Dtfmt v[1]),' to ',(,Dtfmt v[2]),'.'
∇

∇n←v Pid q;bv                                                    
 ⍝ Date input - input format YYYYMMDD
 ⍝ v[1] = minimum date (YYYYMMDD)
 ⍝ v[2] = maximum date (YYYYMMDD)
 ⍝ v[3] = 1
 ⍝ v[4] = minimum number of dates
 ⍝ v[5] = maximum number of dates
 EN1:→(EHN n←(¯1+(n≠' ')⍳1)↓n←PI q,' or ''today'' [YYYYMMDD]?')/0
 →(∨/n≠(⍴n)↑'today')/EN2
 n←⍕10000 100 100⊥⎕TS[⍳3]
 EN2:→(v Lck n)/EN1
 →(∧/~bv←0≠n←⍎n)/0
 →((CAL JUL bv/n)≠bv/n)/ER1
 →0
 ER1:→EN1 ∆ ER(⍕n),' is not a valid date; please re-enter.'
∇

∇z←m Pim p;t                                                         
 ⍝ Select a string from a matrix of options
 ⍝ m = character matrix of choices
 ⍝ p = prompt
 EN1:→(z←EHN t←CS PI p,'?')/END,HP,END
 →(1=+/z←0 0,(((1↑⍴m),⍴t)↑m)∧.=t)/0
 →EN1 ∆ ER 'Error: you have not entered a valid and unique response.'
 HP:'Valid responses are:'
 →EN1,0⍴⎕←(-0 10+⍴m)↑m
 END:z←z[1 3],(1↑⍴m)⍴0
∇

∇n←v Pin q;m;t                                                 
 ⍝ Input one or more numbers
 ⍝ v[1] = minimum value (inclusive)
 ⍝ v[2] = maximum value (inclusive)
 ⍝ v[3] = numeric increment (i.e. 1 = integer)
 ⍝ Remining values are optional
 ⍝ v[4] = minimum number of numbers
 ⍝ v[5] = maximum number of numbers
 ⍝ v[6] = default value of empty entry (or ¯1 means no default)
 ⍝ v[7+] = numbers the entered value cannot be
 ⍝ q is the prompt
 t←⍳0
 ⍎(3=⍴v)/'v←v,1 1'
 m←v[5]
 LP:→(m=⍴t)/EN3
 EN1:→(EHN n←CS PI q,'?')/0,0,EN2
 →(v[⍳5]Lck n)/EN1
 n[Omega n='-']←'¯'
 →(∨/(n←⍎n)∈6↓v)/ER1
 t←t,n
 v[5]←v[5]-⍴,n
 →LP
 EN2: →(0≠⍴t)/EN3
 →(5=⍴v)/0
 →(v[6]=¯1)/0
 t←v[,6]
 EN3:⍎'n←',((m=1)/'''''⍴'),'t'
 →0
 ER1:→EN1 ∆ ER(⍕n), ' already exists; Please reenter.'
∇

∇z←s Pic p;t                                                                               
 ⍝ Input single character
 ⍝ s = character vector of acceptible characters
 ⍝ p = prompt
 ⍝ z = binary vector = end, help, nothing, s[1], s[2], etc.
 EN1:→(z←(EHN t←(¯1+(t≠' ')⍳1)↓t←PI p,' [',s,']?'),(⍴s)⍴0)/0
 →(z[3+⍳⍴,s]←s=1↑t)/0
 →EN1 ∆ ER 'Invalid entry; valid responses are: ',(,((¯1↓s),[1.5]','),' '),'or ',(¯1↑s),'.'
∇

∇n←v Piv q;t;m;s;b;e;a                                                                            
 ⍝ Input a list of numbers from a list of possibles
 ⍝ v[1] = minimum number of numbers to enter
 ⍝ v[2] = maximum number of numbers to enter
 ⍝ v[3...] = list of possible numbers to choose from
 ⍝ q = prompt
 t←⍳0
 n←''
 s←(2≠⍴v)∧v[2]≠1
 ⍎(v[2]=¯1)/'v[2]←1⌈¯2+⍴v'
 a←s∧(m←v[2])≥¯2+⍴v
 LP:→(m≤⍴t)/EN3
 EN1:⍎'→(EHN n←CS PI q,',(s/''', or ['),(a/'a,b,'),(s/'r]'','),'''?'')/0,HP3,EN3'
 →(a∧∧/n=(⍴n)↑'all')/EN2
 →(a∧∧/n=(⍴n)↑'but')/EN4
 →(s∧∧/n=(⍴n)↑'range')/EN5
 n[Omega n='-']←'¯'
 →(v Vck n)/EN1
 t←t,n←⍎n
 v[2]←v[2]-⍴,n
 →LP
 EN2:→(v[1]>⍴n←2↓v)/ER3
 →0
 EN3:→(0=⍴t)/0
 ⍎'n←',((~s)/'''''⍴'),'t'
 →0
 EN4:→(3=⍴v)/ER1
 →(EHN n←(1,(¯3+⍴v),2↓v)Piv q,' - but')/EN1,0,EN1
 →(v[1]>⍴n←(~(2↓v)∊n)/2↓v)/ER3
 →0
 EN5:→(EHN b←((⌊/2↓v),(⌈/2↓v),0 0 1)Pin'Enter the beginning of the range')/EN1,HP1,EN1
 EN6:→(EHN e←(b,(⌈/2↓v),0 0 1)Pin 'Enter the ending of the range')/EN5,HP2,EN5
 n←((b≤2↓v)∧e≥2↓v)/2↓v
 →((v[1]>⍴n),v[2]<⍴n)/ER3,ER2
 t←t,n
 v[2]←v[2]-⍴n
 →LP
 HP1:''
 'Your lower bound is ',⍕⌊/2↓v
 ''
 →EN5
 HP2:''
 'Your upper bound is ',⍕⌈/2↓v
 ''
 →EN6
 HP3:''
 →(~s,a)/0,HP4
 'Enter    all    to choose all entries available.'
 'Enter    but    to choose all entries except a few which you will'
 '                be prompted for.'
 HP4:'Enter    range  to choose all entries between s specified range.'
 ''
 →0
 ER1:→EN1 ∆ ER 'There is only one entry to choose from; the ''but'' option can not be used.'
 ER2:→EN1 ∆ ER 'The range you have specified is too large; re-enter up to ',(⍕v[2]),' numbers.'
 ER3:→EN1 ∆ ER 'You have not entered the minimum number of numbers; re-enter ',(⍕v[1]),' numbers.'
∇

∇Pkg∆Erase pkg;t                                     
 t←⎕EX ((((1↑⍴t),(1+⍴,pkg))↑t)∧.=pkg,'∆')⌿t←⎕NL 2 3 4
∇

∇r←Pkg∆List;t                                               
 ⍝ find names that have delta in them except in first column
 r←,∧\'∆'≠t←(∨/'∆'=0 1↓t)⌿t←⎕NL 2 3 4
 r←(⍴t)⍴(,' ',((×/⍴t),1)⍴t)[r+1+2×¯1+⍳⍴r]
 ⍝ right strip blank columns
 ⍎'r←',((1=⍴⍴r)↑','),'(⌽∨\⌽'' ''∨.≠r)/r←((0,¯1↑⍴r)⍴'' '')⍪r'
 ⍝ sort if necessary
 ⍝ r←r[⍋r;]
 ⍝ remove duplicate rows
 r←(¯1↓1,∨/r≠1⊖r)⌿r
∇

∇z←Pkg∆Present pkg;t                           
 z←∨/(((1↑⍴t),(1+⍴,pkg))↑t←⎕NL 2 3 4)∧.=pkg,'∆'
∇

∇pkg Pkg∆Require ws             
 ⍎(~Pkg∆Present pkg)/')COPY ',ws
∇

∇n Pnt x;i;s;t                                                                      
 →(0=⍴x←((x/¯1↓i),¯1↑i←1 1,⍴x)⍴x)/0
 ⍎(n[3]=¯1)/'n←n[1 2],1↑⍴x'
 n←n[1 2],((¯2+⍴n)×⌈(1↑⍴x)÷+/2↓n)⍴2↓n
 ⍎(n[2]=¯1)/'n[2]←⌊.5×⎕PW-(1↓⍴x)⌈(1↓⍴∆C)⌈1↓⍴∆G'
 i←3
 →(0≠∆LN)/LP1
 EN1:Pg
 ⍎(0≠1↑⍴∆P)/'Out ∆P'
 ⍎(0≠1↑⍴∆C)/'Out(((1↑⍴∆C),n[2])↑'' ''),∆C'
 ∆LN←∆LN+(1↑⍴∆P)+1↑⍴∆C
 LP1:→(0=⍴x)/0
 →((t←(n[1]>∆LN+1↑⍴∆G)∧n[1]<n[i]+(1↑⍴∆C)+(1↑⍴∆P)+1↑⍴∆G),n[1]<∆LN+n[i]+1↑⍴∆G)/EN2,EN1
 EN2:⍎(0≠1↑⍴∆G)/'Out(((1↑⍴∆G),n[2])↑'' ''),∆G'
 Out((s,n[2])↑' '),((s←(n[1]-∆LN+1↑⍴∆G)⌊n[i]⌊1↑⍴x),1↓⍴x)↑x
 x←(s,0)↓x
 ∆LN←∆LN+s+1↑⍴∆G
 ⍎(~t)/'i←i+1'
 ⍎t/'n[i]←n[i]-s'
 →LP1
 ⍝ n[1] = maximum print lines per page
 ⍝ n[2] = number of leading blank columns or ¯1 to center on page
 ⍝ n[2+⍳N] = scalar or vector of lines to print at a time or
 ⍝ n[3] = ¯1 which means print all lines at one time
 ⍝ ∆LN = line numbers printed; initialize to 0
 ⍝ ∆PN = previous page number printed; initialize to 0
 ⍝ ∆P  = matrix - page title or 0 0⍴' '
 ⍝ ∆C  = matrix - column title or 0 0⍴' '
 ⍝ ∆G  = matrix - group title or 0 0⍴' '
 ⍝ x   = data to be printed
∇

∇r←RJ m                  
 r←(-¯1+⎕IO++/∧\⌽m=' ')⌽m
∇

∇z←p RND n                 
 z←(×n)×(⌊0.5+|n×10*p)÷10*p
∇

∇z←RS x                                                     
 ⍎'z←',((1=⍴⍴x)↑','),'(⌽∨\⌽'' ''∨.≠x)/x←((0,¯1↑⍴x)⍴'' '')⍪x'
∇

∇r←n Rank a                          
 ⍝ Changes the rank of a to n
 r←(n↑(×/(1-n)↓r),(1-n)↑r←(n⍴1),⍴a)⍴a
∇

∇z←n Rep v                                            
 z←,⍉(n,⍴v)⍴v
 ⍝ v = scalar or vector of the elements to be repeated
 ⍝ n = the number of times to repeat each element of v
 ⍝ z = each element of v repeated n times
∇

∇Replace;L;f;t;m;s                                                                        
 →(0=⍴Mat)/ER1
 EN1:→(EHN L←(1 ¯1,⍳1↑⍴Mat)Piv'Enter the line numbers you wish to search/replace')/0,EN1,0
 EN2:→(EHN f←PI 'Enter the character string to be searched:')/EN1,EN2,EN1
 EN3:→(EHN t←PI'Enter the character string to replace:')/EN2,EN3,EN4
 EN4:m←Mat[L;]∆ss f,⎕AV[1],t
 →((1↓⍴Mat)=s←(1↓⍴m)⌈1↓⍴Mat)/EN5
 Mat←((1↑⍴Mat),s)↑Mat
 EN5:Mat[L;]←((1↑⍴m),s)↑m
 O'The string has been replaced.'
 →EN2
 ER1: ER'There is no text to replace.'
∇

∇r←Rev m                                                   
 r←⌽⍒(,m∘.≥⍳⌈/m)/,+⍀((⍴m),⌈/m←,m)⍴1
 ⍝ m = numeric vector indicating the field widths
 ⍝ r = indecees needed to reverse each  field within itself
∇

∇r←Roman n;i;⎕IO                              
 ⎕IO←0
 i←0 1000⊤''⍴n
 r←0 5⊤(4⍴10)⊤n←i[1]
 n←,⍉(⍳4)∘.<,⍉(0⌈r-1 3∘.×4=r[1;]),[0]r[0;]⊖4=r
 r←(i[0]⍴'M'),n/,⍉4 16⍴'xMxxDCMDLXCLVIXV'
∇

∇z←Romanu a                                                
 z←+/(¯1+2×z≥1↓z,0)×z←(1 5 10 50 100 500 1000)['IVXLCDM'⍳a]
∇

∇z←Rot m;q                                                           
 q←'abcdefghijklmnopqrstuvwxyz∆ABCDEFGHIJKLMNOPQRSTUVWXYZ⍙0123456789'
 z←((m[;1]≠'⍝')+(m[;1]∊¯10↓q)∧0=(+/∧\':'≠m,' ')-+/∧\m∊q)⌽' ',' ',m
 ⍝ m = ⎕CR of a function
 ⍝ z = m rotated according to labels and comments
∇

∇vw Rpt x;s;t;v;p                                                                            
 x←((×/¯1↓t),¯1↑t←1 1,⍴x)⍴x
 →(23=⍴∆CV)/EN0
 ∆CV←(11↑∆CV),2=⎕NC'∆',4 1⍴'PCGB'
 ⍎∆CV[12]/'∆CV[12]←0≠1↑⍴∆P'
 ⍎∆CV[13]/'∆CV[13]←0≠1↑⍴∆C'
 ⍎∆CV[14]/'∆CV[14]←0≠1↑⍴∆G'
 ⍎∆CV[15]/'∆CV[15]←0≠1↑⍴∆B'
 ⍎(∆CV←∆CV,∆CV[12 15])[16]/'∆CV[16]←(∧/0≠∆CV[7 8])∧(∆CV[7]≤1↑⍴∆P)∧(∆CV[8]+5)≤1↓⍴∆P'
 ⍎∆CV[17]/'∆CV[17]←(∧/0≠∆CV[9 10])∧(∆CV[9]≤1↑⍴∆B)∧(∆CV[10]+5)≤1↓⍴∆B'
 ⍎(∆CV←∆CV,5⍴0)[15]/'∆CV[21]←1↑⍴∆B'
 ⍎∆CV[14]/'∆CV[22]←1↑⍴∆G'
 ⍎'∆CV[20]←0',(∆CV[12]/'+(1↑⍴∆P)'),∆CV[13]/'+1↑⍴∆C'
 ∆CV[19]←+/∆CV[20 22]
 ⍎(∆CV[1]≤0)/'∆CV[1]←66'
 ⍎(0=∆CV[2]←∆CV[2]⌊∆CV[1]-∆CV[21])/'∆CV[2]←∆CV[1]-∆CV[21]'
 ⍎(∆CV[2]<0)/'∆CV[2]←∆CV[1]+∆CV[2]-∆CV[21]'
 ∆CV←∆CV,2=⎕NC'∆EV'
 ⍎∆CV[23]/'∆EV←(,∆EV∘.≥⍳t)/(t×⍴∆EV)⍴(t⍴1),(t←⌈/∆EV)⍴0'
 ⍎(∆CV[23]∧∆CV[13])/'∆C←(((+\t)⍳1↓⍴∆C)↑t←t,(0⌈(1↓⍴∆C)-+/t←((⍴∆EV)×⌈(1↓⍴∆C)÷+/∆EV)⍴∆EV)⍴1)\∆C'
 ⍎(∆CV[23]∧∆CV[14])/'∆G←(((+\t)⍳1↓⍴∆G)↑t←t,(0⌈(1↓⍴∆G)-+/t←((⍴∆EV)×⌈(1↓⍴∆G)÷+/∆EV)⍴∆EV)⍴1)\∆G'
 ⍎(∆CV[3]=¯1)/'∆CV[3]←⌊.5×⎕PW-⌈/(1↓⍴x)',(∆CV[13]/',(1↓⍴∆C)'),∆CV[14]/',1↓⍴∆G'
 EN0:vw[Omega 0=vw←,vw]←1↑⍴x
 ⍎('S'=1↑⍴Pd)/'→0,∆RE←Rpts vw'
 →((p∧(∆CV[2]>|s)∧∆CV[6]=0),p←(∨/0=⍴x)∧0>s←1↑vw)/EN4,EN5
 →(∧/vw<0)/0
 ⍎∆CV[23]/'x←(((+\t)⍳1↓⍴x)↑t←t,(0⌈(1↓⍴x)-+/t←((⍴∆EV)×⌈(1↓⍴x)÷+/∆EV)⍴∆EV)⍴1)\x'
 →(∆CV[6]≠0)/LP1
 EN1:→(0=∆CV[6])/EN3
 →(0=t←∆CV[1]|∆CV[1]-∆CV[6]+∆CV[21])/EN2
 Out(t,1)⍴' '
 EN2:⍎∆CV[15]/'Out ∆B'
 ∆CV[6]←0
 ⍎(('L'≠1↑⍴Pd)∧0=10|∆CV[4])/'O''Completed page '',⍕∆CV[4]'
 EN3:→p/0
 EN4:∆CV[4]←∆CV[4]+1
 →((∆CV[11]≠0)∧∆CV[11]<∆CV[5]←∆CV[5]+1)/ER1
 ⍎∆CV[16]/'∆P[∆CV[7];(⍳5)+¯1+∆CV[8]]←,LJ 5 0⍕∆CV[4]'
 ⍎∆CV[17]/'∆B[∆CV[9];(⍳5)+¯1+∆CV[10]]←,LJ 5 0⍕∆CV[4]'
 ⍎∆CV[12]/'Out ∆P'
 ⍎∆CV[13]/'Out(((1↑⍴∆C),∆CV[3])⍴'' ''),∆C'
 ∆CV[6]←∆CV[6]+∆CV[20]
 →p/EN5
 LP1:→(0=⍴x)/0
 →(0>s)/EN5
 →((∆CV[2]≤∆CV[6]+∆CV[22])∨(∆CV[2]≥s+∆CV[19])∧∆CV[2]<∆CV[6]+s+∆CV[22])/EN1
 ⍎∆CV[14]/'Out(((1↑⍴∆G),∆CV[3])⍴'' ''),∆G'
 Out((v,∆CV[3])⍴' '),((v←(∆CV[2]-∆CV[6]+∆CV[22])⌊s⌊1↑⍴x),1↓⍴x)↑x
 x←(v,0)↓x
 ∆CV[6]←∆CV[6]+v+∆CV[22]
 ⍎(0=s←s-v)/'s←1↑vw←1⌽vw'
 →LP1
 EN5:→(∆CV[2]<∆CV[6]+∆CV[21]+s←|s)/EN6
 Out(s,1)⍴' '
 ∆CV[6]←∆CV[6]+s
 s←1↑vw←1⌽vw
 →LP1
 EN6:s←1↑vw←1⌽vw
 →EN1
 ER1:'***  Error: attempt to print more than ',(⍕∆CV[11]),' pages  ***'
 →
 ⍝ ∆CV = integer vector - control vector
 ⍝ ∆EV = integer vector - column expand vector
 ⍝ ∆P  = character matrix - page title
 ⍝ ∆C  = character matrix - column title
 ⍝ ∆G  = character matrix - group title
 ⍝ ∆B  = character matrix - bottom page title
 ⍝ vw  = numeric vector - vertical widths
 ⍝ x   = character (any shape or rank) - data to be printed
∇

∇n←RptBt;z          
 z←⎕PW↑⎕PW CJ'Page'
 ∆B←z⍪(2,⎕PW)⍴' '
 n←1,5+⌈⎕Pw÷2
∇

∇z←L RptPt R                             
 z←(2,⎕PW)⍴' '
 z←z⍪(-⎕PW)↑'Run date:  ',Date,'  ',Time
 z←z⍪' '
 z←z⍪⎕PW↑⎕PW CJ L
 z←z⍪⎕PW↑R←⎕PW CJ R
 z←z⍪⎕PW↑'-'UL R
 z←z⍪' '
∇

∇Rptc x                                                
 →(2≠⎕NC'∆CV')/0
 →(x=1 2)/EN1,EN2
 (-∆CV[2])Rpt''
 →0
 EN1:→(23≠⍴∆CV)/0
 ⍎(∆CV[13]∧∆CV[23])/'∆C←((1↓⍴∆C)⍴∆EV)/∆C'
 ⍎(∆CV[14]∧∆CV[23])/'∆G←((1↓⍴∆G)⍴∆EV)/∆G'
 ⍎∆CV[23]/'∆EV←∆EV-0,¯1↓∆EV←(((¯1↓∆EV)≠1↓∆EV),1)/⍳⍴∆EV'
 ∆CV←11↑∆CV
 ∆DV←2↑∆DV
 →0
 EN2:¯1 Rpt '  '
∇

∇z←Rpts v;t                                                                   
 →(8=⍴∆DV)/EN1
 ⍎∆CV[13]/'∆T←((¯1+t⍳1),0)↓((-¯1+(⌽t←∨/∆C≠'' '')⍳1),0)↓∆C'
 EN1:→((t∧~0∊⍴x),t←∧/v<z←0)/0,EN2
 ⍎∆CV[23]/'x←(((+\t)⍳1↓⍴x)↑t←t,(0⌈(1↓⍴x)-+/t←((⍴∆EV)×⌈(1↓⍴x)÷+/∆EV)⍴∆EV)⍴1)\x'
 LP1:→(0∊⍴x)/0
 →(0>1↑v)/EN2
 t←(1↑⍴x)⌊1↑v
 ⍎∆CV[14]/'→(z←(t+∆CV[22]) Dsply ∆G)/0'
 →(z←t Dsply(t,1↓⍴x)↑x)/0
 x←(t,0)↓x
 v←1⌽v
 →LP1
 EN2:→(2=⍴∆DV)/EN3
 t←(1+∆DV[2]|∆DV[2]-∆DV[4])⌊|1↑v
 →(z←t Dsply(t,1)⍴' ')/0
 EN3:v←1⌽v
 →LP1
∇

∇Rst;t                                        
 ⍝ close printer
 →('PFLS'=1↑Pd)/EN1,EN3,EN3,EN3
 EN1:t←FILE_IO[25]∆FH
 →EN3
 EN3:t←⎕EX' 'Parse'Pt Pd ∆dv ∆t ∆d ∆f ∆re ∆FH'
∇

∇Screen                             
 →(0=1↑⍴Mat)/ER1
 (0 0⍴' ')∆LP Ealn Mat
 →0
 ER1:ER'There are no lines to list.'
∇

∇Sink r
∇

∇z←Sort m;i;b          
 →((2=⍴⍴m)∧0=1↑0⍴m)/EN1
 z←⍋m
 →0
 EN1:z←⍳1↑⍴m
 i←''⍴1+1↓⍴m
 LP1:→(0≥i←i-1)/0
 z←z[b←⍋m[;i]]
 m←m[b;]
 →LP1
∇

∇z←Sort1 m;i;b         
 ⍎(' '=1↑0⍴m)/'m←⎕AV⍳m'
 →(2≠⍴⍴m)/EN1
 z←⍳1↑⍴m
 i←''⍴1+1↓⍴m
 LP1:→(0≥i←i-1)/0
 z←z[b←⍋m[;i]]
 m←m[b;]
 →LP1
 EN1:z←⍋m
∇

∇x←Sort2 m;v1;v2;n;c                             
 ⍎(0≠1↑0⍴m)/'m←⎕AV⍳m'
 →(2≠⍴⍴m)/EN2
 v2←v1←(1↑⍴m)⍴1
 x←0⍴c←1
 LP1:→(0=+/v1)/0
 →(1<+/(n←⌊/((v1∧v2)⌿m)[;c])=((v1∧v2)⌿m)[;c])/EN1
 x←x,(v2∧v1∧n=m[;c])⍳1
 v2←v1←v1∧~v2∧v1∧n=m[;c]
 →LP1,0⍴c←1
 EN1:v2←v2∧v1∧n=m[;c]
 →((c←c+1)≤1↓⍴m)/LP1
 x←x,v2/⍳⍴v2
 v1←v2←v1∧~v2
 →LP1,0⍴c←1
 EN2:x←⍋,m
∇

∇Srl                                                          
 ⎕RL←1+2147483640|100⊥1↓⎕TS
 ⍝ sets the random number generator to start at a random place
∇

∇z←y Subscn x                                                                  
 z←x⌊0⌈(+⍀x)-y
 ⍝ subtract scan used to subtract scalar y from vector x until you run out of y
 ⍝ will not subtract from an element of x past 0
∇

∇z←Time                                                                              
 z←(,Tmfmt 100⊥((12|z[1])+(12×0=12|z[1])),z[2]),(2 3⍴' AM PM')[1+(z←⎕TS[4 5])[1]≥12;]
∇

∇z←Tmfmt d                                         
 z←(2 0⍕⍉d[,1;]),':',2 0⍕⍉(d←(2⍴100)⊤,d)[,2;]
 z←z[;1],(0 ¯1+⍴z)⍴¯1 0↓(d=' ')⊖(d←,0 1↓z),[0.5]'0'
∇

∇z←a To b;c;⎕IO                                                              
 z←(¯1↓a),(c,c+z[2]×(×z[1]-c)×⍳⌊|(z[1]-c←¯1↑a)÷(z←2↑b,1)[2]),(1+⎕IO←1)↓b
 ⍝ this function is able to be part of a vector to include a run of numbers
 ⍝ z = (¯1↓a),( (¯1↑a) to and including b[1] in increments of b[2] or 1), 2↓b
∇

∇z←Today                
 z←10000 100 100⊥⎕TS[⍳3]
∇

∇z←p Trunc n              
 z←(10*-p)×(×n)×⌊|n←n×10*p
∇

∇z←ul UL m                      
 z←(' ',ul)[1+(∨\z)∧⌽∨\⌽z←m≠' ']
∇

∇z←c UL2 x  
 z←(x≠' ')\c
∇

∇z←c UL3 v                                
 z←((,v∘.≥⍳z)/,((⍴v),z)⍴(z⍴1),(x←⌈/v)⍴0)\c
∇

∇z←Unbox x       
 (x z)←⊃x ⋄ z←x⍴z
∇

∇x←Unique r                                       
 x←((r⍳r)=⍳⍴r)/r
 ⍝ returns a single occurance of all elements in r
∇

∇r←VI n                                                                          
 ⍝ Valid Input
 ⍝ n = string vector
 ⍝ r = binary vector where
 ⍝     1 = valid number
 ⍝     0 = not a valid number
 ⍝ One result for each number in the string
 n←' 'Parse(~(1⌽r)∧r←' '=n)/n←CS n
 r←(1≥+/n='.')∧(∧/'-'≠0 1↓n)∧(1≠-⌿+/∧\' .'∘.≠n)∧(∧/n∈r,'.-¯ ')∧∨/n∊r←'0123456789'
∇

∇r←v Vck n                                                                   
 →(r←2=⍴v)/ER1
 →(0=1↑0⍴n)/EN1
 →(r←(¯1↑(' '≠n)/n←,n)∊' ,')/ER2
 n[Omega n=',']←' '
 n[Omega n='-']←'¯'
 →(r←~∧/VI n)/ER2
 n←,⍎n
 EN1:→(r←(v[1]>⍴n)∨v[2]<⍴n)/ER3
 →(~r←∨/~n∊2↓v)/0
 →0 ∆ ER (⍕n),' does not exist; please re-enter.'
 ER1:→0 ∆ ER 'Error: there are no entries to choose from.'
 ER2:→0 ∆ ER n,' is not numeric; please re-enter.'
 ER3:ER 'Error: you must enter ',(⍕v[1]),' to ',(⍕v[2]),' numbers; re-enter.'
∇

∇WPrintWS2 ⍙x⍙;f;v;t;∆P;∆G;∆B;∆CV;⎕IO;⎕PW;Delim;Cms;Pad;w                
 ⍝ ⍙x⍙ = 0 = print all functions
 ⍝       1 = compress out functions with names that contain ∆ in them
 ⍝       2 = compress out functions that begin with a capitol letter
 ⍝       3 = compress out functions with ∆ or capitol letter in beginning
 ⎕PW←106
 ⎕IO←1
 w←3↓,⊃⍎')WSID'
 ⍝ v←v[Sort v←(~∨/v∧.=⍉(2,1↓⍴v)↑2 1⍴'DW')⌿v←⎕NL 2;]
 Delim←,':'
 Cms←0⍴Pad←'  '
 →('-o landscape'Lhf'APLFL-',w)/0
 f←f[Sort f←⎕NL 3 4;]
 ⍎(∨/⍙x⍙=1 3)/'f←(∧/'∆'≠f)⌿f'
 ⍎(∨/⍙x⍙=2 3)/'f←((f[;1]<'A')∨f[;1]>'Z')⌿f'
 ∆P←(5,⎕PW)⍴' '
 ∆P[3;]←⎕PW↑t←⎕PW CJ w,' as of ',Date,'  ',Time
 ∆P[4;]←⎕PW↑'-'Ul t
 ∆G←(1,⎕PW)⍴' '
 ∆B←(⎕PW↑⎕PW CJ'Page')⍪(2,⎕PW)⍴' '
 ∆CV←48 ¯1 0 0 0 0 0 0 1,(3+⌈⎕PW/2),1000
 ¯2 0 Rpt '      )FNS'Catr ⎕PW Lst f,' '
 ⍝ ¯4 0 Rpt '      )VARS'Catr ⎕PW Lst v,' '
 ¯4 Rpt ''
 LP1:→(0∊⍴f)/EN2
 →(0∊⍴t←⎕CR f[1;])/EN1
 ∆G[1;]←⎕PW↑'    ∇ ',t[1;]
 t←1 0↓Aln Rot t
 ¯2 0 Rpt t⍪(1↓⍴t)↑'    ∇'
 f←1 0↓f
 →LP1
 EN1:∆G←(1,⎕PW)⍴' '
 ¯2 1 Rpt'** Locked function ',(RS f[1;]),'  **'
 f←1 0↓f
 →LP1
 EN2:¯99 Rpt ''
 Rst
 'WS List complete.'
∇

∇z←WSU∆AddLineNumbers t;i;n;q                                                           
 ⍝ return matrix of function with line numbers added
 →(0=1↑⍴z←t←⎕CR t)/0
 q←'abcdefghijklmnopqrstuvwxyz∆ABCDEFGHIJKLMNOPQRSTUVWXYZ⍙0123456789'
 t←((t[;1]≠'⍝')+(t[;1]∊¯10↓q)∧0=(+/∧\t≠':')-+/∧\t∊q)⌽' ',' ',t
 z←((⍴n)⍴(,(-+/∧\⌽i)⌽i)\(,i←n≠' ')/,n←'[',(⍕(n,1)⍴(⍳n←1↑⍴t)-⎕IO),']'),' ',t
∇

∇WSU∆DisplayFns f;⎕PW;t;i;⎕IO;q;h;n
 ⍝ list function definitions to the screen
 ⍝ f is a list of function names separated by space or comma
 ⎕PW←''⍴106,⎕IO←1
 f←', 'Parse f
 q←'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ∆⍙0123456789'
 LP1:→(0=1↑⍴f)/END
 →(~0∊⍴t←⎕CR f[1;])/EN0
 ' '⍪(1,⍴t)⍴t←((f[1;]≠' ')/f[1;]),' IS LOCKED'
 →LP1,0⍴f←1 0↓f
 EN0:h←t[1;]
 t←1 0↓t
 t←((t[;1]≠'⍝')+(t[;1]∊¯10↓q)∧0=(+/∧\t≠':')-+/∧\t∊q)⌽' ',' ',t
 t←((⍴n)⍴(,(-+/∧\⌽i)⌽i)\(,i←n≠' ')/,n←'[',(⍕(n,1)⍴⍳n←1↑⍴t),']'),' ',t
 2 1⍴' '
 '    ∇ ',h
 t
 '    ∇'
 f←1 0↓f
 →LP1
 END:
∇

∇z←WSU∆FindCalls f;ops;m;s
 f←⎕CR f
 m←⎕NL 3 4
 ops←'⋄¨¯<≤=≥>≠∨∧×÷⌶⍫⍒⍋⌽⍉⊖⍟⍱⍲¡⌹?⍵∊⍴~↑↓⍳○*←→⊢⍷⍨⍸⍥⍣⍞⍬⊣⍺⌈⌊_∇∆∘''⎕⍎⍕⍤⌸⌷≡≢⊂⊃∩∪⊥⊤|⍝⍀⌿⍪⍙⍠ '
 f←(~f[;1]∊'1234567890 ')⌿f←ops Parse,f,' '
 z←(∨/(((1↑⍴m),s)↑m)∧.=⍉((1↑⍴f),s←(1↓⍴f)⌈1↓⍴m)↑f)⌿m
 z←z[Sort z;]
 ⍝ f = character vector of a function name
 ⍝ z = character matrix of all functions function f calls
 ⍝ note: all of the functions must be in the workspace
∇

∇WSU∆PrintFunction f;m;Pd;∆FH                                    
 →(0=1↑⍴m←WSU∆AddLineNumbers f)/ER1
 Pd←,'P'
 OpenPrinter '-o landscape'
 Out '    ∇'
 Out m
 Out '    ∇'
 Rst
 →0
 ER1:'*** Function ',f,' does not exist ***'
∇

∇WSU∆PrintWS ⍙x⍙;⎕PW;v;f;L;t;r;i;n;wa;⎕IO;q;⍙y⍙;lpp;plpp;Pd;∆FH;pr       
 ⍝ ⍙y⍙ = 'WSID'
 ⍝ ⍙x⍙ = 0 = print all functions
 ⍝       1 = compress out functions with names that contain ∆ in them
 ⍝       2 = compress out functions that begin with a capitol letter
 ⍝       3 = compress out functions with ∆ or capitol letter in beginning
 ⍝ pr = print rows (rows longer than ⎕PW can take more than one line)
 ⎕PW←''⍴106,⎕IO←1
 v←(~v∧.=(1↓⍴v)↑'⍙x⍙')⌿v←⎕NL 2
 v←(~v∧.=(1↓⍴v)↑'⍙y⍙')⌿v
 Pd←,'P'
 OpenPrinter '-o landscape'
 lpp←48 ⍝ Lines Per Page
 plpp←lpp-6 ⍝ Printable Lines Per Page
 t←⍴f←(f[Sort f←⎕NL 3 4;]),' '
 ⍎(∨/⍙x⍙=1 3)/'t←⍴f←(∧/'∆'≠f)⌿f'
 ⍎(∨/⍙x⍙=2 3)/'t←⍴f←((f[;1]<'A')∨f[;1]>'Z')⌿f'
 Out 3 1↑' '
 ⍝ '      )WSID ON ',Date,' at ',Time,' is ',⍙y⍙
 Out '      )WSID ON ',Date,' at ',Time,' is ',3↓,⊃⍎')WSID'
 Out 2 1↑' '
 Out '      )FNS'
 L←7+1↑⍴t←((⌈t[1]÷r),r×t[2])⍴((r×⌈t[1]÷r←⌊⎕PW÷t[2]),t[2])↑f
 Out t
 Out ' '
 t←⍴v←(v[Sort v;]),' '
 Out '      )VARS'
 L←L+3+1↑⍴t←((⌈t[1]÷r),r×t[2])⍴((r×⌈t[1]÷r←⌊⎕PW÷t[2]),t[2])↑v
 Out t
 Out ' '
 q←'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ∆⍙0123456789'
 LP1:→(0=1↑⍴f)/LP2
 →(~0∊⍴t←⎕CR f[1;])/EN0
 Out ' '⍪(1,⍴t)⍴t←((f[1;]≠' ')/f[1;]),' IS LOCKED'
 →LP1,0⍴L←L+2,0⍴f←1 0↓f
 EN0:⍙y⍙←t[1;]
 t←1 0↓t
 t←((t[;1]≠'⍝')+(t[;1]∊¯10↓q)∧0=(+/∧\t≠':')-+/∧\t∊q)⌽' ',' ',t
 t←((⍴n)⍴(,(-+/∧\⌽i)⌽i)\(,i←n≠' ')/,n←'[',(⍕(n,1)⍴⍳n←1↑⍴t),']'),' ',t
 LP4:pr←+/1⌈⌈((t≠' ')⌈.×⍳¯1↑⍴t)÷⎕PW
 →((plpp<pr),plpp<L+pr+0=pr)/EN1,EN2
 Out 2 1⍴' '
 Out '    ∇ ',⍙y⍙
 ⍎(0≠pr)/'Out t'
 Out '    ∇'
 f←1 0↓f
 →LP1,0⍴L←L+4+pr
 EN1:→(plpp<L)/EN2
 Out 2 1↑' '
 Out '    ∇ ',⍙y⍙
 Out ((1+plpp-L),1↓⍴t)↑t
 t←((1+plpp-L),0)↓t
 L←L+4+plpp-L
 EN2:⍎(0≠L←lpp|lpp-L)/'Out (L,1)⍴'' '''
 →LP4,L←0
 LP2:⍎(0≠L←lpp|lpp-L)/'Out (L,1)⍴'' '''
 L←0
 LP3:→(0=1↑⍴v)/END
 →((lpp<(1 1,⍴t)[1+⍴⍴t]),lpp<L+(1 1,⍴t)[1+⍴⍴t←⍎v[1;]])/EN3,LP2
 EN3:Out 2 1⍴' '
 Out v[1;]
 Out t
 Out ⍴t
 L←L+4+(1 1,⍴t)[1+⍴⍴t]
 →LP3,0⍴v←1 0↓v
 END:⍎(0≠L←lpp|lpp-L)/'Out (L,1)↑'' '''
 Rst
∇

∇d WSU∆PrintWS2 w;f;v;t;∆P;∆G;∆B;∆CV;⎕IO;⎕PW;Delim;Cms;Pad
 ⎕PW←106
 ⎕IO←1
 ⍝ v←v[Sort v←(~∨/v∧.=⍉(2,1↓⍴v)↑2 1⍴'DW')⌿v←⎕NL 2;]
 Delim←,':'
 Cms←0⍴Pad←'  '
 →('-o landscape'Lhf'APLFL-',w)/0
 f←f[Sort f←⎕NL 3 4;]
 ⍎d/'f←((¯1+((⎕AV⍳''∆'')≤⎕AV⍳f[;1])⍳1),1↓⍴f)↑f'
 ∆P←(5,⎕PW)⍴' '
 ∆P[3;]←⎕PW↑t←⎕PW CJ w,' as of ',Date,'  ',Time
 ∆P[4;]←⎕PW↑'-'Ul t
 ∆G←(1,⎕PW)⍴' '
 ∆B←(⎕PW↑⎕PW CJ'Page')⍪(2,⎕PW)⍴' '
 ∆CV←48 ¯1 0 0 0 0 0 0 1,(3+⌈⎕PW/2),1000
 ¯2 0 Rpt '      )FNS'Catr ⎕PW Lst f,' '
 ⍝ ¯4 0 Rpt '      )VARS'Catr ⎕PW Lst v,' '
 ¯4 Rpt ''
 LP1:→(0∊⍴f)/EN2
 →(0∊⍴t←⎕CR f[1;])/EN1
 ∆G[1;]←⎕PW↑'    ∇ ',t[1;]
 t←1 0↓Aln Rot t
 ¯2 0 Rpt t⍪(1↓⍴t)↑'    ∇'
 f←1 0↓f
 →LP1
 EN1:∆G←(1,⎕PW)⍴' '
 ¯2 1 Rpt'** Locked function ',(RS f[1;]),'  **'
 f←1 0↓f
 →LP1
 EN2:¯99 Rpt ''
 Rst
 'WS List complete.'
∇

∇f WSU∆ReplaceFun s;t;r
 ⍝ Replace all occurances of string x to string y in function f
 ⍝ Usage:  'function' WSU∆ReplaceFun  'from string' ∆RD 'to string'
 t←⎕CR f
 r←⎕EX f ⍝ delete old definition in case name is changed
 →(' '=1↑0⍴⎕FX t ∆SS s)/0
 r←⎕FX t ⍝ restore original
∇

∇f WSU∆ReplaceWS t;x;c;m                                                                                      
 ⍝ replace all occurances of string f to string t in the entire workspace
 x←⎕NL 3 4
 LP:→(0=⍴x)/0
 →(0=+/⍴c←⎕CR x[1;])/EN1 ⍝ is an internally defined function (or locked)
 ⍎(~∧/((¯1↑⍴x)↑'∆SS')=x[1;])/'m←⎕EX x[1;]' ⍝ get rid of old definition in case the replace changed its name
 →(0=1↑0⍴⎕FX c ∆SS f,⎕AV[1],t)/ER1
 EN1:x←1 0↓x
 →LP
 ER1:'Error saving ',x[1;]
 m←⎕FX c ⍝ restore original
 x←1 0↓x
 →LP
∇

∇a WSU∆SearchFuns b;c;d;g
 ⍝ This function searches a list of functions for a string
 ⍝ a = list of functions to search (separated by comma or space)
 ⍝ b = the string to search for
 a←', 'Parse,' ',a
 g←0
 LP1:→(0=1↑⍴a)/0
 →(0=1↑⍴c←⎕CR a[1;])/EN2
 →EN2×⍳0=⍴d←(c ∆SS,b)[;1]
 d←((d⍳d)=⍳⍴d)/d
 →EN1×⍳g
 g←1
 EN1:a[1;]
 d←((⍴,d),1)⍴d
 '[',(⍕d-1),']',' ',c[,d;]
 EN2:a←1 0↓a
 →LP1
∇

∇WSU∆SearchWS b;a;c;d;g;x                    
 ⍝ search an entire workspace for string in b
 g←0
 a←⎕NL 3 4
 EN1:→0×⍳0=1↑⍴a
 →(0=1↑⍴c←⎕CR a[1;])/EN3
 →EN3×⍳0=⍴d←(c ∆SS,b)[;1]
 d←((d⍳d)=⍳⍴d)/d
 →EN2×⍳g
 g←1
 EN2:a[1;]
 d←((⍴,d),1)⍴d
 '[',(⍕d-1),']',' ',c[,d;]
 EN3:a←1 0↓a
 →EN1
∇

∇z←l ∆ r
 z←l
∇

∇r←∆DT a                                                   
 ⍝ convert YYYYMMDD into MMDDYYYY
 r←⍎'100 100 10000⊥(10000 100 100⊤a)[2 3 1',((⍴⍴a)⍴';'),']'
∇

∇r←∆DT2 a                                                  
 ⍝ convert MMDDYYYY into YYYYMMDD
 r←⍎'10000 100 100⊥(100 100 10000⊤a)[3 1 2',((⍴⍴a)⍴';'),']'
∇

∇t ∆LLP d;∆LN;∆PN;∆G;∆P;∆C;q;Pd                                   
 →(0=⍴d)/ER1
 t←','Parse t
 ∆C←⍎t[2;]
 q←'printer = print on a hard copy printer (66 lines per page),'
 q←','Parse q,'screen = print on the screen (23 lines per screen)'
 ∆Q:→(q Pim'Enter: printer or screen format')/0,0,∆PR,∆S
 ∆S:∆C ∆LP d
 →0
 ∆PR:→(''Lhf'list')/∆Q
 ∆LN←∆PN←0
 ∆G←0 0⍴' '
 ∆P←⍎t[1;]
 (60,(0⌈⌊0.5×⎕PW-(1↓⍴d)⌈¯1↑⍴∆C),1↑⍴d)Pnt d
 Pg
 Rst
 →0
 ER1:ER'There is no available data.'
∇

∇t ∆LP d;i;j;g;a;z;L;x;f;n;c                                                     
 n←0
 i←-g←21-1↑⍴t←RS t
 c←⌈/(1↓⍴t),1↓⍴d
 j←1↑⍴d←RS d
 →(x←(80>1↓⍴t)∧80>1↓⍴d)/EN1
 f←c↑,5 0⍕5×⍳c
 f[Omega f=' ']←'-'
 i←-g←¯1+g
 →EN1
 LP1:Clear
 ⍎(~x)/'79↑n↓f'
 ((1↑⍴t),79)↑(0,n)↓t
 (g,79)↑(i,n)↓d
 ' '
 EN1:→(EHN a←CS PI '<><> Screen number ',(⍕1 RND 1+i DIV g),' <><> ')/EN10,HP,EN3
 →('bf.+;el-s'=1↑a)/EN4,EN5,EN7,EN9,EN8,0,EN6,EN11,EN12
 →((1,(⌈j DIV g),0.01 0 1)Lck a)/EN1
 i←(j-1)⌊(⌊100×a-⌊a)+g×¯1+⌊a←⍎a
 →LP1
 HP:Clear
 ∆LPH
 →EN1
 EN3:⍎(j>i+g)/'i←i+g'
 →LP1
 EN4:i←0⌈i-g
 →LP1
 EN5:→LP1 ∆ i←0
 EN6:→LP1 ∆ i←0⌈j-g
 EN7:→((1,j,1 0 1)Lck 1↓a)/EN1
 →LP1 ∆ i←¯1+⍎1↓a
 EN8:→((1,c,1 0 1)Lck 1↓a)/EN1
 →LP1 ∆ n←¯1+⍎1↓a
 EN9:→(0=⍴L←,0 ¯1↓d ∆SS 1↓a)/ER1
 →LP1 ∆ i←¯1+1↑(¯1+(L>1+i)⍳1)⌽L
 EN10:Clear
 →0
 EN11:→(0=⍴L←,0 ¯1↓d ∆SS 1↓a)/ER1
 →LP1 ∆ i←¯1+¯1↑(¯1+(L>i)⍳1)⌽L
 EN12:→(0=⍴L←,0 ¯1↓d ∆SS 1↓a)/ER1
 t ∆LP d[L;]
 →LP1
 ER1:→EN1 ∆ ER(1↓a),' does not exist.'
∇

∇z←∆LPH;m                                                      
 m←'R20,L59'
 ''
 m Ctit'F, = advance to the first screen and display it'
 ''
 m Ctit'L, = advance to the last screen and display it'
 ''
 m Ctit'B, = backstep one screen an display it'
 ''
 m Ctit'E, = exit the local report mode'
 ''
 m Ctit'END, = exit the local report mode and clear the screen'
 ''
 m Ctit'A number, = advance to the screen number entered'
 m Ctit'A.B, = advance to screen A - line B'
 m Ctit'.number, = advance to the line number entered'
 ''
 m Ctit';number, = advance to the column number entered'
 m Ctit'stext, = display all lines with text'
 m Ctit'+text, = advance to the text entered'
 m Ctit'-text, = scan backward and display from text'
 ''
∇

∇z←L ∆RD r   
 z←L,⎕AV[1],r
∇

∇x←e ∆SS s;rs;old;new;so;v;i;r                  
 →((' '=1↑0⍴e)∧' '=1↑0↑s←,s)/EN0
 →⍴0⍴⎕←'Invalid data type'
 EN0:rs←(⍴⍴e),⍴e
 →(rs[1]=0 1 2)/S0,V1,M1
 →⍴0⍴⎕←'Invalid data rank'
 S0:→V1,rs←2⍴⍴e←,e
 M1:e←,⎕AV[1],e
 V1:old←s[⍳¯1+s⍳⎕AV[1]]
 →(so←(⍴old)=⍴s)/S1
 s←(1+⍴old)↓s
 new←s[⍳¯1+s⍳⎕AV[1]]
 S1:→((0=⍴old)∨(⍴old)>¯1↑rs)/NONE
 →(0=⍴v←(((1-⍴old)↓e)=old[1])/⍳(⍴e)+1-⍴old)/NONE
 i←1+0×r←⍴old
 LP1:→(r<i←i+1)/EN1
 →(0=⍴v←(old[i]=e[v+i-1])/v)/NONE
 →LP1
 EN1:→(~so)/REPL
 →(2=rs[1])/S2
 →⍴0⍴x←v
 S2:→⍴0⍴x←⍉1+(0 1+1↓rs)⊤v-2
 REPL:i←1+⍴v
 LP2:→(0≥i←i-1)/EN2
 e←((v[i]-1)↑e),new,(v[i]+(⍴old)-1)↓e
 →LP2
 EN2:→(2=rs[1])/S3
 →⍴0⍴x←e
 S3:x←(1↓x,1+⍴e)-x←(⎕AV[1]=e)/⍳⍴e
 →⍴0⍴x←0 1↓((⍴x),⌈/x)⍴(,x∘.≥⍳⌈/x)\e
 NONE:→(~so)/NR
 →(2=rs[1])/NM
 →⍴x←⍳0
 NM:→⍴x←0 2⍴0
 NR:→(2=rs[1])/S4
 →⍴0⍴x←e
 S4:x←0 1↓(0 1+1↓rs)⍴e
∇

⎕CT←1E¯13

⎕FC←(,⎕UCS 46 44 8902 48 95 175)

⎕IO←1

⎕L←0

⎕LX←' ' ⍝ prototype...
  ⎕LX←0⍴⎕LX

⎕PP←10

⎕PR←' '

⎕PS←0

⎕PW←80

⎕R←0

⎕RL←1

⎕TZ←-6

⎕X←0

