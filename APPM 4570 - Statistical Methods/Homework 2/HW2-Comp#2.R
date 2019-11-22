{
#2
#part a
fx=function(x){
  value=((x)/((x^2)+1))
  return(value)
}
integrate(fx,0,2)
resultsg=integrate(fx,0,2)
c=1/resultsg$value
c

gx=function(x){
  fx(x)*c
}

#part b
Gx=function(x){
  value=integrate(gx,0,x)
  return(value)
}


calculate.Info=function(x){
  cat(gx(x),"\n")
  cat(Gx(x)$value)
}
}