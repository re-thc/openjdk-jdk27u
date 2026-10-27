/*
 * Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
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

/**
 * @test
 * @bug 8047223
 * @summary Add algorithm parameter to PKCS8EncodedKeySpec class
 */
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import javax.crypto.EncryptedPrivateKeyInfo;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class Algorithm {

    private static String PKCS8PrivateKey =
        "MIICojAcBgoqhkiG9w0BDAEDMA4ECEgMnpbnMB8TAgIIAASCAoCrbVsww55MC9Kn\n" +
        "sx3ndDxWPhBOlAjRKVlTSQDgkWyC2oVH1mpebJhm3ubVCx9lDKkuJKzsbukNs22D\n" +
        "C6AfZAPqRg5z9lpWABDrZX3HMK3dXLCsOr9cTG50ntwPOBfW6UinkObC0+qo0QwE\n" +
        "xpT2wOzuBqVRJMfeQNlLxiTAHwNd+EsRVIJKGC7pclLXuj61Uzz/pCKqSwPJzPMQ\n" +
        "cDbRoAUS5tVsJlMfiZ7xa/WNulweNvqHanAUeOJCY10tDucwDvWoyLnW4nu7oRLx\n" +
        "Qiu2AxYf6QUgmYD5e0KaA7loNmsaTkC8d/+uDHvf5rbAqNJqpVMEoPJ9ZEvytyh3\n" +
        "FpGyN0W3NjdRAYrjIrIf+EByvdnNSWQh8eS4Mvrd/mhZSR9I8j2mMu4zllqJ4nc2\n" +
        "dWVH1X1NdR+VB0BdAsbQerQJYVodivbbfO/yPDQ14evOVTS0IrSHRXQKEoHs8ORu\n" +
        "ZV3a839s8NQLhkCaT9EIBJ0tj/kFmcU23RlPwbCMGF1XUdJBWNV1jeS98s5BsOQs\n" +
        "lASerVhorGjNGvNNRrwEQSAjdcZVpFTUw5GHZXzbrPEhNR67Uk81kmWtc8dLofmM\n" +
        "q3k8y1ypdk3WsmefXYmYKJv15tZl5GvMhMQLckGx7pyfEQ1ue4OWz+ESAY5Z38yA\n" +
        "4Z9SPVzcJt5Iawj0DtMzH1YXKw8KPaCZbvMVrW+tj6CkX3AJ5T7ml/xbiC7ny3VD\n" +
        "6ecOksTb83Jz1/OVSiuKKTpsQJtPkV3ZaxUCiK7/RMZjKSF3gdddzSVhc25TJO6+\n" +
        "61RFzlUSaeRnwME7MVjC8sbphxrWK8mfHiMk2OjD/KdXknEiGWZpJXpNdvhkZs13\n" +
        "gqiE7fNG";

    private static String keyAlg = "RSA";
    private static String password = "password";

    /*
     * This test checks that a PKCS8EncodedKeySpec is properly constructed
     * from an encrypted private key and that the key algorithm name can be
     * retrieved as expected.
     */
    public static void main(String[] argv) throws Exception {
        EncryptedPrivateKeyInfo epki = new EncryptedPrivateKeyInfo(
                Base64.getMimeDecoder().decode(PKCS8PrivateKey));
        PBEKeySpec pks = new PBEKeySpec(password.toCharArray());
        SecretKeyFactory skf = SecretKeyFactory.getInstance(epki.getAlgName());
        SecretKey sk = skf.generateSecret(pks);
        PKCS8EncodedKeySpec keySpec = epki.getKeySpec(sk);

        // Get the key algorithm and make sure it's what we expect
        String alg = keySpec.getAlgorithm();
        if (!alg.equals(keyAlg)) {
            throw new Exception("Expected: " + keyAlg + ", Got: " + alg);
        }

        System.out.println("Test passed");
    }
}
