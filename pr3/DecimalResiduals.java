import java.util.*;
/** Pure Java compiled-path feasibility; native PR3 entry remains separate. */
public class DecimalResiduals {
 static long grouped(String s,int max){int n=s.length(),i=0;boolean neg=false;if(n>0&&(s.charAt(0)=='-'||s.charAt(0)=='+')){neg=s.charAt(0)=='-';i++;}int digits=n-i;if(digits<1||digits>max)return Long.MIN_VALUE;long v=0;for(;i+4<=n;i+=4){int a=s.charAt(i)-48,b=s.charAt(i+1)-48,c=s.charAt(i+2)-48,d=s.charAt(i+3)-48;if((a|b|c|d)<0||a>9||b>9||c>9||d>9)return Long.MIN_VALUE;v=v*10000+a*1000+b*100+c*10+d;}for(;i<n;i++){int d=s.charAt(i)-48;if(d<0||d>9)return Long.MIN_VALUE;v=10*v+d;}return neg?-v:v;}
 static int parseInt(String s){if(s!=null){long v=grouped(s,9);if(v!=Long.MIN_VALUE)return(int)v;}return Integer.parseInt(s);}
 static long parseLong(String s){if(s!=null){long v=grouped(s,18);if(v!=Long.MIN_VALUE)return v;}return Long.parseLong(s);}
 // The sentinel cannot collide with a successful at-most-18-digit value.
 static void pair(int v,byte[]out,int p){out[p]=(byte)('0'+v/10);out[p+1]=(byte)('0'+v%10);}
 static void put8(int v,byte[]out,int p){pair(v/1000000,out,p);pair(v/10000%100,out,p+2);pair(v/100%100,out,p+4);pair(v%100,out,p+6);}
 static Object attempt(String s,boolean lng,boolean fast){try{return lng?(fast?parseLong(s):Long.parseLong(s)):(fast?parseInt(s):Integer.parseInt(s));}catch(Exception e){return e.getClass()+":"+e.getMessage();}}
 public static void main(String[]args){Random r=new Random(994);long c=0;for(String s:new String[]{null,"","+","-","0","-0","+123","000000000000000000000000001","2147483647","-2147483648","2147483648","9223372036854775807","-9223372036854775808","9223372036854775808","١٢٣","１２３","12x"," 1"})for(boolean lng:new boolean[]{false,true}){if(!Objects.equals(attempt(s,lng,true),attempt(s,lng,false)))throw new AssertionError(s);c++;}byte[]out=new byte[12];for(int it=0;it<100000;it++){int a=r.nextInt();long b=r.nextLong();if(parseInt(Integer.toString(a))!=a||parseLong(Long.toString(b))!=b)throw new AssertionError();int v=r.nextInt(100000000);Arrays.fill(out,(byte)0x55);put8(v,out,2);int got=0;for(int i=2;i<10;i++)got=got*10+out[i]-48;if(got!=v||out[0]!=0x55||out[1]!=0x55||out[10]!=0x55||out[11]!=0x55)throw new AssertionError();c+=3;}System.out.println("PASS decimal grouped correctness checks="+c+"; no timing or production adoption claim");}
}
