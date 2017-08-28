package com.hjx.util;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author pkd
 *
 */
public final class StringUtil
{
  public static final char SEPARATOR = '|';
  public static final String STR_EMPTY = "";

  public static final String addLeft(String origString, String paddingString, int length)
  {
    if ((isNullOrBlank(origString)) || (length <= 0) || 
      (isNullOrBlank(paddingString))) {
      return origString;
    }
    for (int i = 0; i < length; i++) {
      origString = paddingString + origString;
    }
    return origString;
  }

  public static String avoidNull(String value)
  {
    return value == null ? "" : value;
  }

  public static String exceptionStackTrace(Throwable e)
  {
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    String returnStr = "";
    if (e != null) {
      e.printStackTrace(pw);
      pw.flush();
      pw.close();
      returnStr = sw.toString();
    }
    return returnStr;
  }

  public static int getByteLength(String value, String charset)
  {
    if (value == null)
      return 0;
    try
    {
      return value.getBytes(charset).length;
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }return 0;
  }

  public static String getObjString(Object obj)
  {
    if (obj == null) {
      return "";
    }
    return obj.toString();
  }

  public static int getUTF8Length(String value)
  {
    return getByteLength(value, "UTF-8");
  }

  public static boolean isNullOrBlank(String value)
  {
    return (value == null) || ("".equals(value.trim()));
  }

  public static String join(Object[] objects) {
    return join(objects, "|");
  }

  public static String join(Object[] objects, String separator)
  {
    if ((objects == null) || (objects.length == 0)) {
      return null;
    }

    StringBuffer sb = new StringBuffer();
    Object[] arrayOfObject = objects; int j = objects.length; for (int i = 0; i < j; i++) { Object object = arrayOfObject[i];
      if (object != null)
      {
        String objString = object.toString();
        if (objString != null) {
          objString = objString.replaceAll("\\\\", 
            Matcher.quoteReplacement("\\\\"));
          sb.append(objString);
        }

      }

      sb.append(separator);
    }

    return sb.toString().substring(0, sb.length() - 2);
  }

  public static String leftByCharsetByte(String value, String charset, int bytelen)
  {
    if (value == null) {
      return null;
    }

    try
    {
      Charset cs = Charset.forName(charset);
      if (cs.encode(value).limit() <= bytelen) {
        return value;
      }

      int byteCount = 0; int stringIndex = 0;
      while (true) {
        int currentByteLen = cs.encode(
          value.substring(stringIndex, stringIndex + 1)).limit();
        if (byteCount + currentByteLen > bytelen)
        {
          break;
        }
        byteCount += currentByteLen;
        stringIndex++;
      }

      return value.substring(0, stringIndex);
    }
    catch (UnsupportedCharsetException e) {
      e.printStackTrace();
    }return null;
  }

  public static String leftByUTF8Byte(String value, int bytelen)
  {
    return leftByCharsetByte(value, "UTF-8", bytelen);
  }

  public static String limitLength(String strValue, int bytelen)
  {
    int strlen = bytelen / 3;
    int real_bytelen = strlen * 3;

    if ((strValue == null) || ("".equalsIgnoreCase(strValue))) {
      return "";
    }
    try
    {
      byte[] utf8_bytes = strValue.getBytes("UTF-8");
      if (utf8_bytes.length <= bytelen) {
        return strValue;
      }
      byte[] cutoff_bytes = new byte[real_bytelen];
      System.arraycopy(utf8_bytes, 0, cutoff_bytes, 0, real_bytelen);

      String strResult = new String(cutoff_bytes, "UTF-8");

      return strResult;
    }
    catch (Exception e) {
      if (strValue.length() < strlen)
        return strValue; 
    }
    return strValue.substring(0, strlen);
  }

  public static void main(String[] args)
  {
    Object[] ids = { Integer.valueOf(12), Integer.valueOf(33), Integer.valueOf(43), Integer.valueOf(3223), Integer.valueOf(232), Integer.valueOf(223) };
    System.out.println(join(ids));
  }

  public static String padLeft(String value, char c, int lenght)
  {
    if (isNullOrBlank(value)) {
      value = "";
    }
    int orgLength = value.length();
    for (int i = 0; i < lenght - orgLength; i++) {
      value = c + value;
    }
    return value;
  }

  public static final String removeLeftPad(String value, char padChar)
  {
    if (isNullOrBlank(value)) {
      return value;
    }
    char[] chars = value.toCharArray();
    int i = 0;
    for (char c : chars) {
      if (c != padChar) {
        break;
      }
      i++;
    }

    return i == 0 ? value : value.substring(i);
  }

  public static String[] split(String ori)
  {
    if (ori == null) {
      return null;
    }

    List strings = new ArrayList();

    Pattern pattern = Pattern.compile("(?<!\\\\)(\\\\\\\\)*\\Q\\|\\E");

    Matcher matcher = pattern.matcher(ori);
    int currentStart = 0;
    while (matcher.find())
    {
      int pos = matcher.end();
      strings.add(ori.substring(currentStart, pos - 2));
      currentStart = pos;
    }

    strings.add(ori.substring(currentStart, ori.length()));

    String[] strs = (String[])strings.toArray(new String[0]);

    for (int i = 0; i < strs.length; i++) {
      strs[i] = strs[i].replaceAll("\\Q\\\\\\E", 
        Matcher.quoteReplacement("\\"));
    }
    return strs;
  }

  public static String trimToLength(String strValue, int bytelen)
  {
    int strlen = bytelen / 3;
    int real_bytelen = strlen * 3;

    if ((strValue == null) || ("".equalsIgnoreCase(strValue))) {
      return "";
    }
    try
    {
      byte[] utf8_bytes = strValue.getBytes("UTF-8");
      if (utf8_bytes.length <= bytelen) {
        return strValue;
      }
      byte[] cutoff_bytes = new byte[real_bytelen];
      System.arraycopy(utf8_bytes, 0, cutoff_bytes, 0, real_bytelen);

      String strResult = new String(cutoff_bytes, "UTF-8");

      return strResult;
    }
    catch (Exception e) {
      if (strValue.length() < strlen)
        return strValue; 
    }
    return strValue.substring(0, strlen);
  }
}