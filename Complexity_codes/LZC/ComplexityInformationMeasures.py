import numpy as np


def BelongToVoc(string1,string2):
    out=False
    string1_len = np.size(string1)
    for i in np.arange(0,np.size(string2)-string1_len+1):
        if  np.array_equal(string1,string2[i:i+string1_len]):
            out=True
            break
    return out

def FastBelongToVoc(BigString,SmallString):
    if(np.size(BigString)<=np.size(SmallString)):
        return np.array_equal(BigString,SmallString)
    t1 = np.size(BigString)
    t1 = int(np.ceil(t1/2))
    t2 = np.size(SmallString)
    return FastBelongToVoc(BigString[0:t1],SmallString) or FastBelongToVoc(BigString[t1:],SmallString) or BelongToVoc(BigString[t1-t2+2:t1+t2-1],SmallString)

def LZC(signal):
    if np.any(np.isnan(signal)):
        return np.nan
    
    median=np.median(signal)
    P=(np.sign(signal-median)+1)/2
    ind=(signal==median)
    P[ind]=0
    c=1
    terminate=False
    r=0
    i=0
    while terminate==False:
        S=P[0:r+1]
        Q=P[r+1:r+i+2]
        concat=np.concatenate((S,Q))
        if not BelongToVoc(Q,concat[0:-1]):
            c=c+1
            r=r+i+1
            i=0
        else:
            i=i+1
        if r+i+2==np.size(P):
            terminate=True
    
    return c*np.log2(np.size(P))/np.size(P)

def LZC1(signal):
    
    # if np.any(np.isnan(signal)):
    #     return np.nan
    
    # median=np.median(signal)
    # P=(np.sign(signal-median)+1)/2
    # ind=(signal==median)
    # P[ind]=0
    P=signal
    c=2
    terminate=False
    r=0
    i=0
    while terminate==False:
        S=P[0:r+1]
        Q=P[r+1:r+i+2]
        concat=np.concatenate((S,Q))
        if not BelongToVoc(Q,concat[0:-1]):
            c=c+1
            r=r+i+1
            i=0
        else:
            i=i+1
        if r+i+2==np.size(P):
            terminate=True
    
    return c*np.log2(np.size(P))/np.size(P)


def MutualInformation(Signal1,Signal2,SampleSize1,SampleSize2):
    Temp = LZC1(Signal1) + LZC1(Signal2)
    CombinedSignal = Signal1 * SampleSize2 + Signal2
    return Temp - LZC1(CombinedSignal) 
