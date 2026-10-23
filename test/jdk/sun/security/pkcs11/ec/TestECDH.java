/*
 * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 6405536
 * @summary Basic known answer test for ECDH
 * @author Andreas Sterbenz
 * @library /test/lib ..
 * @modules jdk.crypto.cryptoki
 * @run main/othervm TestECDH
 */

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.interfaces.ECPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Arrays;
import javax.crypto.KeyAgreement;
import jdk.test.lib.security.Providers;


public class TestECDH extends PKCS11Test {

    // from https://tools.ietf.org/html/rfc7027#appendix-A.1
    private final static String pubBrainpoolP256r1a = "305a301406072a8648ce3d020106092b24030302080101070342000444106e913f92bc02a1705d9953a8414db95e1aaa49e81d9e85f929a8e3100be58ab4846f11caccb73ce49cbdd120f5a900a69fd32c272223f789ef10eb089bdc";
    private final static String privBrainpoolP256r1a = "3042020100301406072a8648ce3d020106092b240303020801010704273025020101042081db1ee100150ff2ea338d708271be38300cb54241d79950f77b063039804f1d";
    private final static String pubBrainpoolP256r1b = "305a301406072a8648ce3d020106092b2403030208010107034200048d2d688c6cf93e1160ad04cc4429117dc2c41825e1e9fca0addd34e6f1b39f7b990c57520812be512641e47034832106bc7d3e8dd0e4c7f1136d7006547cec6a";
    private final static String privBrainpoolP256r1b = "3042020100301406072a8648ce3d020106092b240303020801010704273025020101042055e40bc41e37e3e2ad25c3c6654511ffa8474a91a0032087593852d3e7d76bd3";
    private final static String secretBrainpoolP256r1 = "89afc39d41d3b327814b80940b042590f96556ec91e6ae7939bce31f3a18bf2b";

    // from https://tools.ietf.org/html/draft-merkle-ikev2-ke-brainpool-00#appendix-A.5
    private final static String pubBrainpoolP320r1a = "306a301406072a8648ce3d020106092b240303020801010903520004bc43666c00e4b943fe1c785dd8aa842a42ab54b0b49819f960f77694193cd3afa71b6b3c826c773469e998892c0764468023c8e3a7b8f219a1446042be175d4476b2fdfd85b22ead2f29101a1242a578";
    private final static String privBrainpoolP320r1a = "304a020100301406072a8648ce3d020106092b2403030208010109042f302d02010104287cd9c454ba907f7617e262a7fd73764c4a3157c13f82279ef9f062be5d49a8e390b66a4dcedfa867";
    private final static String pubBrainpoolP320r1b = "306a301406072a8648ce3d020106092b240303020801010903520004b1246229429354d1d687bca48bccd6fc733b146dac03642a0ad4b896f5d8bcbd2f4bca16776e4526a41683898f9a76ef36ea2dc7b74d419e55cf3664721890d6a2b2fb8ceb7c113167ed137a358ee37f";
    private final static String privBrainpoolP320r1b = "304a020100301406072a8648ce3d020106092b2403030208010109042f302d0201010428b832a73da5f671e80d87f09372544801f6812224b19a4bc1b37aa7db0842e6dd3ca11de0f802bfed";
    private final static String secretBrainpoolP320r1 = "730314d906b2f21dc11be05031b028d665696beec7139328cdf70c718be5d208659bb96743a88067";

    // from https://tools.ietf.org/html/rfc7027#appendix-A.2
    private final static String pubBrainpoolP384r1a = "307a301406072a8648ce3d020106092b240303020801010b0362000468b665dd91c195800650cdd363c625f4e742e8134667b767b1b476793588f885ab698c852d4a6e77a252d6380fcaf06855bc91a39c9ec01dee36017b7d673a931236d2f1f5c83942d049e3fa20607493e0d038ff2fd30c2ab67d15c85f7faa59";
    private final static String privBrainpoolP384r1a = "3052020100301406072a8648ce3d020106092b240303020801010b0437303502010104301e20f5e048a5886f1f157c74e91bde2b98c8b52d58e5003d57053fc4b0bd65d6f15eb5d1ee1610df870795143627d042";
    private final static String pubBrainpoolP384r1b = "307a301406072a8648ce3d020106092b240303020801010b036200044d44326f269a597a5b58bba565da5556ed7fd9a8a9eb76c25f46db69d19dc8ce6ad18e404b15738b2086df37e71d1eb462d692136de56cbe93bf5fa3188ef58bc8a3a0ec6c1e151a21038a42e9185329b5b275903d192f8d4e1f32fe9cc78c48";
    private final static String privBrainpoolP384r1b = "3052020100301406072a8648ce3d020106092b240303020801010b043730350201010430032640bc6003c59260f7250c3db58ce647f98e1260acce4acda3dd869f74e01f8ba5e0324309db6a9831497abac96670";
    private final static String secretBrainpoolP384r1 = "0bd9d3a7ea0b3d519d09d8e48d0785fb744a6b355e6304bc51c229fbbce239bbadf6403715c35d4fb2a5444f575d4f42";


    // from https://tools.ietf.org/html/rfc7027#appendix-A.3
    private final static String pubBrainpoolP512r1a = "30819b301406072a8648ce3d020106092b240303020801010d03818200040a420517e406aac0acdce90fcd71487718d3b953efd7fbec5f7f27e28c6149999397e91e029e06457db2d3e640668b392c2a7e737a7f0bf04436d11640fd09fd72e6882e8db28aad36237cd25d580db23783961c8dc52dfa2ec138ad472a0fcef3887cf62b623b2a87de5c588301ea3e5fc269b373b60724f5e82a6ad147fde7";
    private final static String privBrainpoolP512r1a = "3062020100301406072a8648ce3d020106092b240303020801010d04473045020101044016302ff0dbbb5a8d733dab7141c1b45acbc8715939677f6a56850a38bd87bd59b09e80279609ff333eb9d4c061231fb26f92eeb04982a5f1d1764cad57665422";
    private final static String pubBrainpoolP512r1b = "30819b301406072a8648ce3d020106092b240303020801010d03818200049d45f66de5d67e2e6db6e93a59ce0bb48106097ff78a081de781cdb31fce8ccbaaea8dd4320c4119f1e9cd437a2eab3731fa9668ab268d871deda55a5473199f2fdc313095bcdd5fb3a91636f07a959c8e86b5636a1e930e8396049cb481961d365cc11453a06c719835475b12cb52fc3c383bce35e27ef194512b71876285fa";
    private final static String privBrainpoolP512r1b = "3062020100301406072a8648ce3d020106092b240303020801010d044730450201010440230e18e1bcc88a362fa54e4ea3902009292f7f8033624fd471b5d8ace49d12cfabbc19963dab8e2f1eba00bffb29e4d72d13f2224562f405cb80503666b25429";
    private final static String secretBrainpoolP512r1 = "a7927098655f1f9976fa50a9d566865dc530331846381c87256baf3226244b76d36403c024d7bbf0aa0803eaff405d3d24f11a9b5c0bef679fe1454b21c4cd1f";

    @Override
    protected boolean skipTest(Provider p) {
        if (p.getService("KeyAgreement", "ECDH") == null) {
            System.out.println("Provider does not support ECDH, skipping");
            return true;
        }

        if (isNSS(p) && getNSSECC() == ECCState.Basic) {
            System.out.println("NSS only supports Basic ECC, skipping");
            return true;
        }

        return false;
    }

    @Override public void main(Provider p) throws Exception {
        /*
         * PKCS11Test.main will remove this provider if needed
         */
        Providers.setAt(p, 1);
        System.out.println("Testing provider " + p.getName());

        if (false) {
            KeyPairGenerator kpg = KeyPairGenerator.getInstance("EC", p);
            kpg.initialize(256);
            KeyPair kp = kpg.generateKeyPair();
            System.out.println(toString(kp.getPublic().getEncoded()));
            System.out.println(toString(kp.getPrivate().getEncoded()));
            kp = kpg.generateKeyPair();
            System.out.println(toString(kp.getPublic().getEncoded()));
            System.out.println(toString(kp.getPrivate().getEncoded()));
            return;
        }

        if (getSupportedECParameterSpec("brainpoolP256r1", p).isPresent()) {
            test(p, pubBrainpoolP256r1a, privBrainpoolP256r1a, pubBrainpoolP256r1b, privBrainpoolP256r1b, secretBrainpoolP256r1);
        }
        if (getSupportedECParameterSpec("brainpoolP320r1", p).isPresent()) {
            test(p, pubBrainpoolP320r1a, privBrainpoolP320r1a, pubBrainpoolP320r1b, privBrainpoolP320r1b, secretBrainpoolP320r1);
        }
        if (getSupportedECParameterSpec("brainpoolP384r1", p).isPresent()) {
            test(p, pubBrainpoolP384r1a, privBrainpoolP384r1a, pubBrainpoolP384r1b, privBrainpoolP384r1b, secretBrainpoolP384r1);
        }
        if (getSupportedECParameterSpec("brainpoolP512r1", p).isPresent()) {
            test(p, pubBrainpoolP512r1a, privBrainpoolP512r1a, pubBrainpoolP512r1b, privBrainpoolP512r1b, secretBrainpoolP512r1);
        }

        System.out.println("OK");
    }

    private final static void test(Provider p, String pub1s, String priv1s,
            String pub2s, String priv2s, String secrets) throws Exception {
        KeyFactory kf = KeyFactory.getInstance("EC", p);
        PublicKey pub1 = kf.generatePublic(new X509EncodedKeySpec(parse(pub1s)));
        System.out.println("Testing using parameters "
                + ((ECPublicKey)pub1).getParams() + "...");

        PrivateKey priv1 = kf.generatePrivate(new PKCS8EncodedKeySpec(parse(priv1s)));
        PublicKey pub2 = kf.generatePublic(new X509EncodedKeySpec(parse(pub2s)));
        PrivateKey priv2 = kf.generatePrivate(new PKCS8EncodedKeySpec(parse(priv2s)));
        byte[] secret = parse(secrets);

        KeyAgreement ka1 = KeyAgreement.getInstance("ECDH", p);
        ka1.init(priv1);
        ka1.doPhase(pub2, true);
        byte[] s1 = ka1.generateSecret();
        if (Arrays.equals(secret, s1) == false) {
            System.out.println("expected: " + toString(secret));
            System.out.println("actual:   " + toString(s1));
            throw new Exception("Secret 1 does not match");
        }

        KeyAgreement ka2 = KeyAgreement.getInstance("ECDH", p);
        ka2.init(priv2);
        ka2.doPhase(pub1, true);
        byte[] s2 = ka2.generateSecret();
        if (Arrays.equals(secret, s2) == false) {
            System.out.println("expected: " + toString(secret));
            System.out.println("actual:   " + toString(s2));
            throw new Exception("Secret 2 does not match");
        }
    }

    public static void main(String[] args) throws Exception {
        main(new TestECDH(), args);
    }

}
