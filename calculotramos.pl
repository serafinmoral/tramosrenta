from matplotlib import pyplot as plt
import numpy as np


def cuota(u):

    ss = 0.067*min(u,12*4495.50 )
    u = u-ss
    u = u-2000


    if u <= 14047.5:
        u = max(0,u-6498 )
    elif u <=19747.5:
        u = u -  (6498 -1.14*(u-14047.5))
    u = max(0,u-5500)

    if u <= 12450:
        tot = u*0.19
    elif u <= 20200:
        tot = 2*(1182.75+(u-12450)*0.12)
    elif u <= 35200:
        tot = 2*(2112.75+(u-20200)*0.15)
    elif u<= 60000:
        tot = 2*(4362.75+(u-35200)*0.185)
    elif u<= 300000:
        tot = 2*(8950.75+(u-60000)*0.225)
    else:
        tot = 2*(62950.75+(u-300000)*0.245)
    return tot
x = []
y = []
t = []
p = []

for z in range(1000,100100,100):
    
    x.append(z)
    tot = cuota(z)
    zm = z+1
    zp = z*1.01
    totm = cuota(zm)
    totp = cuota(zp)

    net = ((zp-totp)-(z-tot))/(z-tot)*100

    p.append(net)
    dif = (totm-tot)*100
   
    t.append(dif)
    por = tot/z*100
    y.append(por)



plt.plot(x, y)
plt.show()
plt.plot(x, p)
plt.show()
plt.plot(x,t)
plt.yticks(np.arange(0, 50, 5))  
plt.show()




    
