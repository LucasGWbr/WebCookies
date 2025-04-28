/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Nubia
 */
public class cripto {
    
    public static String criptografar(String senha) throws NoSuchAlgorithmException{
       MessageDigest m=MessageDigest.getInstance("MD5");
       m.update(senha.getBytes(),0,senha.length());
       
       return new BigInteger(1,m.digest()).toString(16);
    }
    
}
