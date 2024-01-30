package com.example.demo;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JasyptTest extends JasyptConfig {

    @Test
    public void jasypt_encyrpt_and_decrypt_test(){
    	String text = "fucking project";
        StandardPBEStringEncryptor jasypt = new StandardPBEStringEncryptor();
        jasypt.setPassword("password");
        
        // String encryptedText = jasypt.encrypt(plainText);
        // String decryptedText = jasypt.decrypt(encryptedText);

        // System.out.println(encryptedText);

        // assertThat(plainText).isEqualTo(decryptedText);        
        
    }
}
