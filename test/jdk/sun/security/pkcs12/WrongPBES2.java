/*
 * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/*
 * @test
 * @bug 8214513
 * @summary A PKCS12 keystore from Java 8 using custom PBE parameters cannot be read in Java 11
 */

import javax.crypto.spec.PBEParameterSpec;
import java.io.*;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;

public class WrongPBES2 {

    private static final char[] PASS = "changeit".toCharArray();

    // This is a PKCS 12 file using PBES2 with an incorrect encoding before
    // JDK-8202837 is fixed. It is generated with these 2 commands:
    //
    // keytool -genkeypair -alias a -dname CN=A -keystore ks -storepass changeit
    // $JDK10/bin/java WrongPBES2 reenc
    //
    // The certificate bag was then re-encrypted in place with
    // PBEWithSHA1AndDESede (same salt and iteration count) and the MAC
    // was recalculated.
    static final String P12_FILE =
            "308208940201033082084d06092a864886f70d010701a082083e0482083a3082" +
            "08363082035206092a864886f70d010701a08203430482033f3082033b308203" +
            "37060b2a864886f70d010c0a0102a08202ee308202ea307406092a864886f70d" +
            "01050d306706092a864886f70d01050d305a303906092a864886f70d01050c30" +
            "2c0414000000000000000000000000000000000000000002030186a002012030" +
            "0c06082a864886f70d020b0500301d060960864801650304012a04105abc352d" +
            "35d98fd77d8c8cf205d690c6048202703ff97bd4488a6a5569993fb6f89792e7" +
            "33632b20fdc502bf0801c8ee80683d064c4dae5b8880ade893a87bfdb4427dfd" +
            "01bc5656fdb50f45f1e8d60b37416d2f3b1be9e8ae145bfe035f9d947fa49a31" +
            "baef86dec6780a0f96a7ad5d9ef850b15f56d6b6f2f0798c190b01b42d955d36" +
            "96f1416efb0c246b56e3715c1ccef701f975f6faf7e7640b8edca79f996682d8" +
            "5a414c8210004f247058c3362f328c12d024ea88de5ab3d6c50a7cf8f32b69de" +
            "999930ccb29be0d278216db0959d9b142e4c46207edaf91f37708e0250e99262" +
            "c4acba4b83c2c0affb3bfc2d5bfe210baffe56ba1f667c9e3c33e0c4164d0c16" +
            "abc89bca2c1af7fc234163a6a17e4852ee08053bdf699c8659ea57f77427ab3b" +
            "cea357a85ffd80589403bc73ff50490f9b0bfb37fedf495aae8ef8a00da7d1e1" +
            "62c49dacf82503e803953f48e302d1ae1b7e7870a479c7861ffc236469807f31" +
            "da0b15a915a62d4f0a42698a4c9779595619effa04765f91342821229752ec6d" +
            "6e0657ad4e41979847b5903ddb6a6819b859797a2f663898694fe294cc85b9c3" +
            "d485516659dcd6d89f631903be35367315b131f9f5ec63ee5bf25f3afcf8bc9c" +
            "d9056a56f951746664cfa3ed0596e005fda6fb753d9c67c92fd1a9f22d06a59e" +
            "9c7af058dddad3b9265fc29c18122f55c07a1780050251990c221ba2b3767586" +
            "405def7a1b224135ac4a694f0e3d27666486531aad9e27a3855f54e2916a642a" +
            "ed06fc5275b675bbf457a26978b0f4306c166119dedc3aedf366cbf34efa647e" +
            "a65b8451c7b1d083fe1ee3a8493a0330ee7da68552614e50ca7326a25d741e40" +
            "ccac2149d1ff5cb8778a3b08ed3d9a1774c971525454b7c20b18610b9bc847cc" +
            "3136301106092a864886f70d01091431041e020061302106092a864886f70d01" +
            "09153114041254696d652031353433363738383539323632308204dc06092a86" +
            "4886f70d010706a08204cd308204c9020100308204c206092a864886f70d0107" +
            "013029060a2a864886f70d010c0103301b0414e6d3162d3b75f103fac6ea3fbf" +
            "96d08c0225d308020300c3508082048854480d7863e1eb88e3f523f7f0af027e" +
            "db2e7d173ee2adb8acd6dcdf5c7ef2ab194932023e457e20198c98766a58d3a0" +
            "80873799c900c6d13683214a3f0b0c0e66a83b74b94765397df1dc15352f9700" +
            "75491efca195b323149f0049b75c41dd8d3568fc90afd8d6ac12426d6456cabe" +
            "3a05f7fd33636dc5b81d926d4aed7009c457bd179a107abf0c81d9d11ac608c2" +
            "eaae581d047db49c0636787f2cbf262903fd5c93427d71dad8066ec2047189fa" +
            "1b85874d6b721a38788fd81a7f4aa8ff267cad8181eef5ab304726b9a96d517f" +
            "972a67d0ded0900844c2c44dfb9c856a62624bd07f9eef87a4148a7e0579e426" +
            "f8cd478f2b085eabff23d166037b550d97f4b11cfa71fa1cbfbe58531461c14d" +
            "b410e0c7bbdcbaacabb01e3afc1c4577e8bda1eea7d33008e2a7c94fef4077b1" +
            "48fac148ef8245b6a9835d731a8fadb253cd7cd7e00bf6fadedfbc77a941cc17" +
            "ee5b770e55aa71ab1cc0d4749350cd8f448f95af865f2c982937ecbaa0d7f4d3" +
            "4398e9926079d60c6e44bc00f15b3b2eeb1c8dd939fec78af132c610dbe09a57" +
            "acfffc08389e2bed368810e037f001a9094d16e5c91b141e2139d7cd2ee28b8b" +
            "63338d1390b8fd201f84b2701a5dcf61b36e104a215de9af90c37b6b3eca8302" +
            "79b893ea96c95b37575ab341dfb32872d4ab1ae31403196fc8072a93361678f9" +
            "35a3cfc1630837819be63d17f8aedcf59f397e420208de0863e8f6c46eb918fd" +
            "ad3bb43d54e4cac00b903502e41c6f2944c98640303c384002721be238d44ed7" +
            "372faf68c354d183037b2104c2959e11dbf63b3f86f2cda4a8efa8780186366b" +
            "ba89634d7bd70598e05d2c24077f7b45385c10f61d5cef36c6facb5183431acf" +
            "6b60c9a0ab3d78f13f1e01c39410963c209f6e750a53eed951dfc0882a95e638" +
            "53b4d000954656e6c2fd88737293ca764cc1463fa60d8a94acaa72d8a863e89d" +
            "61b431fdf01634d6afe0d8dd82257e7254b733b8f25ca28f793d507db321786b" +
            "d63552dcf2809eb09d4caa42c96b543d426c89d151d6d7b5f741509300de079c" +
            "6e77c5d185dcb6f10fcd7901a67c6c63fda1eaef5501c0bdde5e5900a669a6be" +
            "d83caf5ece74aabb9f223285a4e511de089f4ddbc6a90fe4c28400455e6268af" +
            "a555aa87d1d593521675f35497f2ed45f8d045721cba457eab4a44dcc9b73c4d" +
            "a70295f473f08a53a20660572a0fdc5988bc742afb0f0481d094969ff2aea5da" +
            "5d99bc37fe39581556c04df57b2c6fa1ddcfd542a0648d3bf92f86d81578404a" +
            "acf9ddbb9a2f1ac7e9724db3435398c3467f3f640922be956798fac39bdc07cb" +
            "c51ca012aa1435d9e007db3fbab5a4889b1756e193b0d5824ae4be40cd38cd66" +
            "e2bdee6492f2664072daf6e903b2a8b38038152902651509d228654f953af162" +
            "f57b3a0c38265e8cb65d0c80167135d9546ead0593610dcbefd2158a14e44a27" +
            "5219b19a2e368791a0264a3750bf146d5fa538af174201783823acfe11ed40e9" +
            "18089df2fddf461c874b39eb48225ed8e8e51a556f1a24e0f4f05fe94c80e1d4" +
            "6faf37991402292c81aa25352c4803a7508068ab488bcf534000d8983715bc27" +
            "4dced02f8f78e144afbbde05b63e907e5b93e530703a79d2303e302130090605" +
            "2b0e03021a05000414f7657543727eb2ef7bfb85ee84d0591ddbc6b6e7041441" +
            "f87d07019980ef69b635f06017567e36aa3d8802030186a0";

    public static void main(String[] args) throws Exception {
        if (args.length > 0 && args[0].equals("reenc")) {
            reEncodeWithPBES2();
        } else {
            test();
        }
    }

    private static void test() throws Exception {
        byte[] p12 = new byte[P12_FILE.length() / 2];
        for (int i = 0; i < p12.length; i++) {
            p12[i] = Integer.valueOf(P12_FILE.substring(2 * i, 2 * i + 2), 16)
                    .byteValue();
        }
        KeyStore ks = KeyStore.getInstance("pkcs12");
        ks.load(new ByteArrayInputStream(p12), PASS);
        System.out.println(ks.getKey("a", PASS));
    }

    private static void reEncodeWithPBES2() throws Exception {
        KeyStore keyStore = KeyStore.getInstance(new File("ks"), PASS);
        KeyStore.PrivateKeyEntry privateKeyEntry = new KeyStore.PrivateKeyEntry(
                (PrivateKey)keyStore.getKey("a", PASS),
                new Certificate[] { keyStore.getCertificate("a") });
        keyStore.setEntry("a", privateKeyEntry, new KeyStore.PasswordProtection(
                PASS, "PBEWithHmacSHA512AndAES_256",
                new PBEParameterSpec(new byte[20], 100_000)));
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        keyStore.store(bout, PASS);
        byte[] p12 = bout.toByteArray();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < p12.length; i++) {
            if (i % 32 == 0) {
                if (i != 0) {
                    sb.append("\" +\n");
                }
                sb.append("\"");
            }
            sb.append(String.format("%02x", p12[i] & 0xff));
        }
        sb.append("\";\n");
        System.out.println(sb.toString());
    }
}
