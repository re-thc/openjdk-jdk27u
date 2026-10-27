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
 * @bug 8215769
 * @summary Java cannot probe pkcs12 files exported by Firefox
 */

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.KeyStore;

public class ProbeBER {

    public static final void main(String[] args) throws Exception {

        // This is a PKCS12 file using BER encoding
        String p12String =
            "3080020103308006092a864886f70d010701a0802480048208eb308030800609" +
            "2a864886f70d010701a08024800482054a3082054630820542060b2a864886f7" +
            "0d010c0a0102a08204f7308204f33025060a2a864886f70d010c010330170410" +
            "8dbfae75350a0f53d71bce1f8d7544b902030927c0048204c8d72c2675a105cb" +
            "7403547cce341b58b5c6943e69ae1ca597f5ea1777497adfbba455283524a46d" +
            "8d8301b2ba4d2304513ef4761e8a65a6e64f6d646a1501fa7f3c282d0f9a5a23" +
            "71b7fdf251464db00b617ed7017f11ab9286e10f7a5d30a21755c3aaf50473e4" +
            "41262bf103fa141f9caba66562f2a96aaf12a200c38aba11991ad73d9cee0008" +
            "2a7077a4a9a597336745895555cb24ca910be68c23ac5c4a5d1e47d387bf031d" +
            "3833c2cff88d6157da6152731b083ecfca20e3850f3fca4743d7ee0fb773be44" +
            "4e63b00c1096f34719dfef53912d01e477491bf0b7b01227c8fbbaf48fa399f7" +
            "f30d1ec0f622f66686d8a8baffdb811c201b408b89d483cc92f2bdcf7771b982" +
            "d43e821cfa45d789aeed87ca9ec9e3b283dc45395c6503f80e8d9e658e4e9160" +
            "5b141afec2ab065e1be39c0e67d665bedf2049561c583e3fd825688798bcbdb6" +
            "73cd2109cc20713fb6bab07648883e8f479e4877fc0c43cebdf0fe3a9e81b87a" +
            "ab4314cc2e8834360b3c9e49bf78fb2175112880191911846764b16eaf361584" +
            "039325e9c1a054f2c20cf4baf1ddd8f5636c4067cb411d4643031ce7299cc9dc" +
            "bc175b57e31bf5914c3e3cc490fb0538f34774898d3f5189ddf2261dadc25d89" +
            "bc3068dea6786023fe8a727e390e8b4a9b0a924490443d38962b57804b646169" +
            "427a42a36b2a9046e27f805f088516e9d07b0b77fc59650979364fe0cf44debf" +
            "6748d4b9c7fd54ec35fd51208e089a8b2a2117ee20df2225589595769137de28" +
            "a058e9a316828bb76499dfb66184e7fe6abb6840f664cf328e99126234a7c15d" +
            "b9c64acc2645e9e54b8a3888fea85054d9f3cea8586104b9de852bae696cb217" +
            "fca6e063e2272db81ae9ec9f4c291711c1bce51c72fed98f40a3dd6ba7858be1" +
            "1eda50f3270bbe753255e46b2dd0aface15a5ff034a2604b10f2afb8db2a74fd" +
            "9d3bd4b146386fa4b5b850fe857e79fc5e34d2e056c4f2eb9fdbf2922eabc36f" +
            "c7fe5fcdd5909a440b77e49256edd3ae77d317845d1dbbe7c3d05652540b35b8" +
            "2df52b7f120ec335fdc3ee52c888fdccdbffd83aae8544be2c6b8e3c9ee2fc05" +
            "3750833085dbcbd019e9584bec7b80cb95689459e5436819006c02dd844635a8" +
            "3fc565c8e5ddc1344a9a1cba9c9fcefe684cc75b4483f4e6072cc07eee72b1fe" +
            "4e93b23843969acdca4359a53a39a01da62ec154ef00491589c8f15a39b01b38" +
            "58c4dfdb13a939e7fd82228d8b2f99b3d59e595fc7b990ffa6b6fa82af64becd" +
            "5b9a98a6cca74f6b2f6812678c781bfa7ab0f764c29ca6c22f38bf57bfd9d063" +
            "0e69d8800b25f9c8aa3008522fbf68a4486cdd7d534cfc21ee5426dc0e5329c0" +
            "e7967d9b53b90638555f3d662bd539f8f235a35e1ed0546572a7a0395c325d23" +
            "373eef5b57bb937371947abffa806c8629c2cc32755153ca478ab97b3e76f187" +
            "5ab59bbcb7c57b5a96d0b26f133b46f0e2eca8471135b6d0f4b1ea3a6d8654d8" +
            "642a70a8f225fbffb199c051ff45ae91e50384f6b46b4373fa4fdca847dbc71e" +
            "c077269e7644805cd82c6624de1d1c376d646c6133d1718ad031216690913366" +
            "fc4eaa831830619d45dcc5335baf90855e5438ad5d2ac2e31cf2cc5a5b2867f4" +
            "193af8658097226bb4521061b2bef8dd0def00f86175d0b14301516f5a3c7119" +
            "7423cb327c3dc67efdc34605ab76a12895aba2582b5b4acc4b3dbb3a6d8679d0" +
            "2b3138301106092a864886f70d01091431041e020061302306092a864886f70d" +
            "01091531160414e5ae3d63720b42d660fcfb2453ebec069783b7f30000000000" +
            "00308006092a864886f70d010706a0803080020100308006092a864886f70d01" +
            "07013025060a2a864886f70d010c0103301704103b377c374d17c41a669fed4c" +
            "0fe3738a02030927c0a08004820320c273d79a3c49a5b19d8473588fa0bf4b4f" +
            "fdf521e9365876f0c75337f40387ea6caf59318e13ee9e73b0148b8095b1f6c5" +
            "f2516ffb94f52a89916e9103c08e549253fe907d5d37fd72e39311bf2c39e2a9" +
            "80b730cc843f7e657eecd623d12f05a2b0a209fc6fe649f4afb60a74b8cd9f96" +
            "6dd4ac22177d9f658038877aac23a549ee7450e18b5fc5002f4939f81cc53f3b" +
            "b83fce0f75e12213fa0582b1a87c6ffbc10467aea3a2cbc044d3a5ec63b9e7f8" +
            "3c8ad11dd9d59eab15c079d8510e09600ebc8fc70c61b83978ff499a692677f7" +
            "14f2bbcdb7746702e4875ce7d562de9868c739fcaa86881fa89890866c12b4d5" +
            "242288b8adcb4ec772420a7e6f8a6b6165f1b3fd2506b2199332370d17899302" +
            "c6b2e62449497773a58728b735850c50ba712d620c710bffa87d7c24ee6eeb5f" +
            "e7e78d6583452fad96eb464970896726ac6874ed479be4e2173fa53b28d865fa" +
            "04e0670f993f0191d7e65cf1de83ac3bfefa7368f1d3f0b2d9f2d90a731c7bed" +
            "c398ce5431ca213d6545e3c2cfa6ddb2a690388c359614ff1d64031f799d543d" +
            "0abaf4fff4f5e28b512faf6178c58574fdc455d7696d9699223c79a1f5630d4a" +
            "2806db463870bf461a98577b25b8e0343da4d09d4281228461b399d0acf54828" +
            "82ac34add6a351324d714d1ac11c98c82019e92d5620d4d47635872c3957350c" +
            "cf916be5ee899b3f2e0c803b3103a72e665752edf7fee832ff25c45ec467b556" +
            "6d33d1328cf85d941858df2e3150f9740a012eef71741ef54d967c0728cf85d2" +
            "e65705ffa41bf344f5355b5eb68049d776349940722a8cc9daee4b0bec1cf2b3" +
            "c3b0925ac9b85c86827e45bd4544aac519d0664dafc3f5ab06a6251f81f4b6e5" +
            "cb3d79e8de82a2dd4c41a93bd947d8be25be913fc02967f241a0eaee8f444b95" +
            "4116e65c6bc476574fab6d5dcc86cd8f6acf1522f0a9e3bab21099fdfd563f7a" +
            "607faa165858440e272911a611f76b4288610982ead136fc7316590aea457a2c" +
            "cb36ebdd41eca4edea71d4e831c2452009269c534478ae871034d8999597f5be" +
            "e95c7810b58056e0694f10e503098475ea6de37a096c45bc936e079b74daad52" +
            "f95c7fdda16b1e40798c243c2a7b0d0408fe012aaf4c2feb6e00000000000000" +
            "0000000000000000000000303a3021300906052b0e03021a0500041476c7ed70" +
            "280959e461152c59361b7ad5ecd2a8e30410247e59baa3f6e829425929a052e7" +
            "6c9a02030927c00000";
        byte[] p12 = new byte[p12String.length()/2];
        for (int i=0; i<p12.length; i++) {
            p12[i] = Integer.valueOf(
                    p12String.substring(2*i,2*i+2), 16).byteValue();
        }

        Files.write(Path.of("p12"), p12);
        KeyStore.getInstance(new File("p12"), "changeit".toCharArray())
                .getCertificate("a");
    }
}
