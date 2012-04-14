<script type="text/javascript">

if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)){ //test for Firefox/x.x or Firefox x.x (ignoring remaining digits);
 var ffversion=new Number(RegExp.$1) // capture x.x portion and store as a number
 if (ffversion>=5)
  document.write(" FF 5.x or above")
 else if (ffversion>=4)
  document.write(" FF 4.x or above")
 else if (ffversion>=3)
  document.write(" FF 3.x or above")
 else if (ffversion>=2)
  document.write(" FF 2.x")
 else if (ffversion>=1)
  document.write(" FF 1.x")
}
else if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)){ //test for MSIE x.x;
 var ieversion=new Number(RegExp.$1) // capture x.x portion and store as a number
 if (ieversion>=9)
  document.write(" IE9 or above")
 else if (ieversion>=8)
  document.write(" IE8 or above")
 else if (ieversion>=7)
  document.write(" IE7.x")
 else if (ieversion>=6)
  document.write(" IE6.x")
 else if (ieversion>=5)
  document.write(" IE5.x")
}
else  if (/Opera[\/\s](\d+\.\d+)/.test(navigator.userAgent)){ //test for Opera/x.x or Opera x.x (ignoring remaining decimal places);
 var oprversion=new Number(RegExp.$1) // capture x.x portion and store as a number
 if (oprversion>=10)
  document.write("You're using Opera 10.x or above")
 else if (oprversion>=9)
  document.write("You're using Opera 9.x")
 else if (oprversion>=8)
  document.write("You're using Opera 8.x")
 else if (oprversion>=7)
  document.write("You're using Opera 7.x")
 else
  document.write("")
}
else
 document.write(navigator.appVersion)
</script>