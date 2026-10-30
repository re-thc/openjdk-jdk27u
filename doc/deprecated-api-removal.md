# Experimental removal of pre-Java-8 deprecated APIs

This branch deliberately removes the 44 public or protected members listed below.
This is a fork-specific compatibility choice. Old compiled callers may fail to
link, source callers may stop compiling, reflective lookups may fail, and custom
subclasses may need to migrate removed overrides. The list is not a promise that
all external software has migrated.

The fork computes serialization UIDs for `Date`, `Character` and `String`.
Removing their public members changes those computed UIDs again. Streams written
by master before this API removal can therefore fail with `InvalidClassException`,
including SQL date/time subclasses whose stream contains a `java.util.Date`
descriptor and serialized `String.class` objects. Ordinary serialized string
values use the special string protocol. Current-image round trips remain
supported; cross-version UID preservation is not claimed or restored with fixed
UID fields.

The six deprecated JDBC interface contracts, `String.getBytes(int,int,byte[],int)`,
the four-argument high-byte `String` constructor, all 13 SQL Date/Time throwing
guards, `Date.parse`, and all monitor management
attributes remain. The latter include `ObservedObject`, `Threshold`, `DerivedGauge`
and `DerivedGaugeTimeStamp`. `QueryExp`/`QueryEval` retain the real JMX query context
handling; the removed `ValueExp` setters were a declaration and two no-ops.

`File.toURL()` and `Properties.save(OutputStream,String)` remain because the
installed JT Harness 6.0 ea b24 (built September 2026) still calls them. The batch
observer classpath and template-association operations were reproduced failing
when those methods were absent. PostgreSQL JDBC 42.7.14, MySQL Connector/J 26.10.0
and MariaDB Connector/J 4.0.0 were checked separately; their observed legacy JDBC
and String dependencies remain. These bounded checks do not establish universal
framework or driver compatibility.

`URLDecoder.decode(String)` remains because Logback 1.5.37, as bundled by a
current Micronaut sample, invokes it when watching a file-backed logging
configuration. Enabling `scan="true"` on the sample XML reproduced a startup
`NoSuchMethodError` before this method was restored. The default packaged
configuration did not reach that branch. Gradle 9.8.2 also bundles an older
jcifs caller of this decoder. The retained four-argument high-byte `String`
constructor is used by the sample's current Netty 4.2.18.Final and Jackson 3.2.2
dependencies.

The three obsolete `MBeanServer.deserialize` overloads are removed together with
their matching implementations in `JmxMBeanServer` and
`MBeanServerAccessController`. Private `Date.getCalendarDate` and mailto
`Handler.setURLHandler` disappear with their callers. No replacement compatibility
framework or new wrapper API is introduced. HTTP continues to use unchanged
`Date.parse`, including its required legacy HTTP-date formats.

## Explicit test policy

Tests of retained behavior remain runnable. There are no package exclusions,
blanket skips, disabled assertions or changes to the restored monitor tests.

* `java/io/ByteArrayOutputStream/ToString.java`: retire only the `toString(int)`
  assertion; keep default and explicit UTF8 decoding assertions.
* `java/io/StreamTokenizer/ReadAhead.java`: retire only the InputStream constructor
  branch and its helper; preserve every limited-Reader read-ahead assertion.
* `java/io/StreamTokenizer/Reset.java`: use a resettable `StringReader` fixture;
  preserve the token/reset assertions.
* `java/net/URLDecoder/EncodeDecode.java` and
  `java/net/URLEncoder/URLEncodeDecode.java`: use the retained explicit-charset
  encoder overload with `Charset.defaultCharset()`, preserving all inputs and
  existing assertions. Existing one-argument decoder calls remain tested;
  `java/net/URLEncoder/DecodeNonEncoded.java` is unchanged.
* `java/sql/test/sql/DriverManagerTests.java`: retire only `tests17`, which tests
  the removed PrintStream logging pair. Keep `tests18`'s PrintWriter enable/disable
  and identity assertions and every other driver test. DateTests, TimeTests and
  TimestampTests are unchanged; their initial failures were shared-directory
  compilation errors from `tests17`, not behavior failures in those classes.
* `java/util/Date/Bug4955000.java` is explicitly retired, rather than excluded:
  both of its comparison loops exclusively test the removed `Date.UTC` API.
  `DateGregorianCalendarTest` and retained normalization/cutover/extrema tests remain.
* `java/util/Date/DateRegression.java`: migrate convenience construction through
  retained `Date.parse`/`Date(long)` or the retained six-argument constructor. Keep
  hash, clone, parser, normalization, cutover, extrema and toString/getTime assertions.
  Field-setter triggers are retired with those APIs. Because `setTime` clears the
  cache and would otherwise weaken the old clone-alias test, the clone test also
  checks that a populated mutable calendar cache is not shared, using a narrowly
  opened `java.util` package. Public clone/mutation assertions remain.
* `java/util/Date/DateTest.java`: retain both GMT/Los_Angeles paths, both cached and
  uncached states, every retained getter assertion and every parser vector. Use
  retained constructors and `getYear()` to prepare the fixture. Retire only the
  deleted setter triggers and `getDay`/`getTimezoneOffset`-specific expectations.

* Fixture sweep: use six-argument `Date` construction with zero seconds for the
  removed five-argument convenience constructor, and an explicit UTC `Instant`
  for the fixed 1998 reference instant. Calendar/time-zone assertions are unchanged.
* Loader fixtures use `defineClass(null, bytes, offset, length)`, preserving the
  old overload's null name and default protection domain. The module-access
  fixture reflects the retained named overload with the same protected access.
  RMI provider fixtures
  similarly use `loadClass((String) null, name)`, preserving SPI dispatch arguments.
* Serialization/datagram fixtures use the retained four-argument high-byte String
  constructor. DER-time diagnostics print the corresponding UTC Instant; all
  decoded-Date equality assertions remain.
* `java/lang/String/Exceptions.java`: retire only the two-argument high-byte
  constructor group; existing four-argument success, null and bounds checks stay.
* `java/security/Security/Nulls.java`: retire only the removed
  `getAlgorithmProperty(null,null)` check; every other Security null check stays.
* `java/net/Socket/NullHost.java`: retire only the boolean-stream constructor case;
  retained null-host constructor cases stay. `java/net/Socket/UdpSocket.java` is
  explicitly retired because it exclusively tests the two removed boolean-stream
  constructors. There are no replacement exclusions or ProblemList entries.

## Removed public and protected members

Signatures below identify the declaring class and parameter types. JVM return
and parameter descriptors are included to make the compatibility cut exact.

* `java.io.ByteArrayOutputStream.toString(int)` — `(I)Ljava/lang/String;`
* `java.io.StreamTokenizer(java.io.InputStream)` — `(Ljava/io/InputStream;)V`
* `java.lang.Character.isJavaLetter(char)` — `(C)Z`
* `java.lang.Character.isJavaLetterOrDigit(char)` — `(C)Z`
* `java.lang.Character.isSpace(char)` — `(C)Z`
* `java.lang.ClassLoader.defineClass(byte[], int, int)` — `([BII)Ljava/lang/Class;`
* `java.lang.String(byte[], int)` — `([BI)V`
* `java.net.Socket(java.lang.String, int, boolean)` — `(Ljava/lang/String;IZ)V`
* `java.net.Socket(java.net.InetAddress, int, boolean)` — `(Ljava/net/InetAddress;IZ)V`
* `java.net.URLConnection.getDefaultRequestProperty(java.lang.String)` — `(Ljava/lang/String;)Ljava/lang/String;`
* `java.net.URLConnection.setDefaultRequestProperty(java.lang.String, java.lang.String)` — `(Ljava/lang/String;Ljava/lang/String;)V`
* `java.net.URLEncoder.encode(java.lang.String)` — `(Ljava/lang/String;)Ljava/lang/String;`
* `java.net.URLStreamHandler.setURL(java.net.URL, java.lang.String, java.lang.String, int, java.lang.String, java.lang.String)` — `(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V`
* `java.rmi.dgc.VMID.isUnique()` — `()Z`
* `java.rmi.server.RMIClassLoader.getSecurityContext(java.lang.ClassLoader)` — `(Ljava/lang/ClassLoader;)Ljava/lang/Object;`
* `java.rmi.server.RMIClassLoader.loadClass(java.lang.String)` — `(Ljava/lang/String;)Ljava/lang/Class;`
* `java.rmi.server.RemoteStub.setRef(java.rmi.server.RemoteStub, java.rmi.server.RemoteRef)` — `(Ljava/rmi/server/RemoteStub;Ljava/rmi/server/RemoteRef;)V`
* `java.security.Security.getAlgorithmProperty(java.lang.String, java.lang.String)` — `(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;`
* `java.security.Signature.getParameter(java.lang.String)` — `(Ljava/lang/String;)Ljava/lang/Object;`
* `java.security.Signature.setParameter(java.lang.String, java.lang.Object)` — `(Ljava/lang/String;Ljava/lang/Object;)V`
* `java.sql.DriverManager.getLogStream()` — `()Ljava/io/PrintStream;`
* `java.sql.DriverManager.setLogStream(java.io.PrintStream)` — `(Ljava/io/PrintStream;)V`
* `java.util.Date(int, int, int, int, int)` — `(IIIII)V`
* `java.util.Date(java.lang.String)` — `(Ljava/lang/String;)V`
* `java.util.Date.UTC(int, int, int, int, int, int)` — `(IIIIII)J`
* `java.util.Date.getDay()` — `()I`
* `java.util.Date.getTimezoneOffset()` — `()I`
* `java.util.Date.setDate(int)` — `(I)V`
* `java.util.Date.setHours(int)` — `(I)V`
* `java.util.Date.setMinutes(int)` — `(I)V`
* `java.util.Date.setMonth(int)` — `(I)V`
* `java.util.Date.setSeconds(int)` — `(I)V`
* `java.util.Date.setYear(int)` — `(I)V`
* `java.util.Date.toGMTString()` — `()Ljava/lang/String;`
* `java.util.Date.toLocaleString()` — `()Ljava/lang/String;`
* `javax.management.AttributeValueExp.setMBeanServer(javax.management.MBeanServer)` — `(Ljavax/management/MBeanServer;)V`
* `javax.management.MBeanServer.deserialize(java.lang.String, byte[])` — `(Ljava/lang/String;[B)Ljava/io/ObjectInputStream;`
* `javax.management.MBeanServer.deserialize(java.lang.String, javax.management.ObjectName, byte[])` — `(Ljava/lang/String;Ljavax/management/ObjectName;[B)Ljava/io/ObjectInputStream;`
* `javax.management.MBeanServer.deserialize(javax.management.ObjectName, byte[])` — `(Ljavax/management/ObjectName;[B)Ljava/io/ObjectInputStream;`
* `javax.management.StringValueExp.setMBeanServer(javax.management.MBeanServer)` — `(Ljavax/management/MBeanServer;)V`
* `javax.management.ValueExp.setMBeanServer(javax.management.MBeanServer)` — `(Ljavax/management/MBeanServer;)V`
* `javax.xml.stream.XMLEventFactory.newInstance(java.lang.String, java.lang.ClassLoader)` — `(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljavax/xml/stream/XMLEventFactory;`
* `javax.xml.stream.XMLInputFactory.newInstance(java.lang.String, java.lang.ClassLoader)` — `(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljavax/xml/stream/XMLInputFactory;`
* `javax.xml.stream.XMLOutputFactory.newInstance(java.lang.String, java.lang.ClassLoader)` — `(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljavax/xml/stream/XMLInputFactory;`
