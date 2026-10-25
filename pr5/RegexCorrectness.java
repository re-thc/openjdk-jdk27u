import java.util.*;
import java.util.regex.*;
import java.security.*;
import java.nio.charset.StandardCharsets;
/** Compare the complete observable Matcher sequence through an output digest. */
public class RegexCorrectness {
 static MessageDigest d; static long count;
 static void emit(String s){d.update(s.getBytes(StandardCharsets.UTF_8));d.update((byte)0);count++;}
 static String result(Matcher m,boolean b){String s=b?m.start()+":"+m.end():"false";if(b)for(int i=0;i<=m.groupCount();i++)s+="/"+m.group(i);return s+":"+m.hitEnd()+":"+m.requireEnd();}
 public static void main(String[]args)throws Exception {d=MessageDigest.getInstance("SHA-256");
 String[]patterns={"abc","abcd","abcdZ","(abcd)+x","abcd(?=z)","abcd(z|q)","ab(c)d", "^abcd$","abcd.*q","a.*bcdef", "ééééX", "😀abcd", "abcd$","ab\\Qcd\\Ez","abcd(?:x|yz)","aaaaaaaaab"};
 String[]texts={"","ab","abc","abX","abcd","abcdabcdz","xxabcdqxx","abcdXabcdz","aaaaaaaaaaaaaaaaaac","ééééXé","😀abcd","abcdyz","abc\nabcd","abXd"};
 for(String ps:patterns)for(String text:texts)for(int type=0;type<3;type++)for(int from=0;from<=text.length();from++)for(int to=from;to<=text.length();to++){CharSequence cs=type==0?text:type==1?new StringBuilder(text):new CharSequence(){public int length(){return text.length();}public char charAt(int i){return text.charAt(i);}public CharSequence subSequence(int a,int b){return text.subSequence(a,b);}};Pattern p=Pattern.compile(ps);Matcher m=p.matcher(cs).region(from,to);emit(result(m,m.matches()));m.reset(cs).region(from,to);emit(result(m,m.lookingAt()));m.reset(cs).region(from,to);int n=0;while(n++<20){boolean b=m.find();emit(result(m,b));if(!b)break;}}
 System.out.println("cases="+count+" sha256="+HexFormat.of().formatHex(d.digest()));}
}
